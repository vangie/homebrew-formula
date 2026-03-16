#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cd "$(dirname "${BASH_SOURCE[0]}")/.."

FORMULA=""
BRANCH_PREFIX="update-"
BASE_BRANCH="master"

show_help() {
    cat << EOF
Usage: $0 [OPTIONS]

Options:
    -f, --formula FORMULA    Formula name (required)
    -p, --prefix PREFIX      Branch prefix (default: update-)
    -b, --base-branch BRANCH Base branch (default: master)
    -h, --help               Show this help message

Examples:
    $0 -f wechat-moments     # Create PR for wechat-moments update

EOF
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--formula)
            FORMULA="$2"
            shift 2
            ;;
        -p|--prefix)
            BRANCH_PREFIX="$2"
            shift 2
            ;;
        -b|--base-branch)
            BASE_BRANCH="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo -e "${RED}Error: Unknown option $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

if [[ -z "$FORMULA" ]]; then
    echo -e "${RED}Error: Formula name is required${NC}"
    show_help
    exit 1
fi

FORMULA_FILE="${FORMULA}.rb"

check_changes() {
    echo -e "${YELLOW}Checking for changes...${NC}"
    
    if git diff --quiet "$FORMULA_FILE"; then
        echo -e "${GREEN}No changes detected. Skipping PR creation.${NC}"
        return 1
    fi
    
    echo -e "${GREEN}Changes detected. Proceeding with PR creation.${NC}"
    return 0
}

get_version() {
    grep 'version "' "$FORMULA_FILE" | sed 's/.*version "\([^"]*\)".*/\1/'
}

configure_git() {
    echo -e "${YELLOW}Configuring git...${NC}"
    
    if [[ -n "${GITHUB_ACTIONS:-}" ]]; then
        git config --local user.email "github-actions[bot]@users.noreply.github.com"
        git config --local user.name "github-actions[bot]"
        echo -e "${GREEN}Configured git for GitHub Actions${NC}"
    fi
}

create_pull_request() {
    local version="$1"
    local branch_name="${BRANCH_PREFIX}${FORMULA}-v${version}"
    local title="Update ${FORMULA} to ${version}"
    local body="This PR automatically updates the ${FORMULA} formula to version ${version}.

## Changes
- Updated version to ${version}
- Updated URL and SHA256 checksum

## Auto-generated
This PR was automatically created by the GitHub Action workflow."

    echo -e "${YELLOW}Creating pull request...${NC}"
    
    git checkout "$BASE_BRANCH" || {
        echo -e "${RED}Error: Failed to checkout base branch $BASE_BRANCH${NC}"
        exit 1
    }
    
    git pull origin "$BASE_BRANCH" || true
    
    if git show-ref --verify --quiet "refs/heads/$branch_name"; then
        echo -e "${YELLOW}Branch $branch_name already exists locally, deleting...${NC}"
        git branch -D "$branch_name"
    fi
    
    echo -e "${YELLOW}Creating branch $branch_name...${NC}"
    git checkout -b "$branch_name"
    
    echo -e "${YELLOW}Staging changes...${NC}"
    git add "$FORMULA_FILE"
    
    if git diff --cached --quiet; then
        echo -e "${YELLOW}No changes to commit${NC}"
        exit 0
    fi
    
    echo -e "${YELLOW}Committing changes...${NC}"
    git commit -m "$title"
    
    echo -e "${YELLOW}Pushing branch to remote...${NC}"
    git push -f -u origin "$branch_name"
    
    echo -e "${YELLOW}Creating pull request using gh...${NC}"
    gh pr create \
        --title "$title" \
        --body "$body" \
        --base "$BASE_BRANCH" \
        --head "$branch_name" || {
        if gh pr view "$branch_name" >/dev/null 2>&1; then
            echo -e "${GREEN}Pull request already exists for this branch${NC}"
        else
            echo -e "${RED}Failed to create pull request${NC}"
            exit 1
        fi
    }
    
    echo -e "${GREEN}Pull request created successfully!${NC}"
}

main() {
    echo -e "${GREEN}=== PR Creator for ${FORMULA} ===${NC}"
    
    if ! check_changes; then
        exit 0
    fi
    
    local version
    version=$(get_version)
    echo -e "${GREEN}Version: $version${NC}"
    
    configure_git
    
    create_pull_request "$version"
    
    echo -e "${GREEN}PR creation completed successfully!${NC}"
}

main "$@"
