#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

cd "$(dirname "${BASH_SOURCE[0]}")/.."

PYPI_PACKAGE="wechat-moments"
FORMULA_FILE="wechat-moments.rb"
VERSION=""
AUTO_DETECT=true

show_help() {
    cat << EOF
Usage: $0 [OPTIONS]

Options:
    -v, --version VERSION    Specify version to update to
    -h, --help               Show this help message

Examples:
    $0                        # Auto-detect latest version from PyPI
    $0 -v 0.1.1              # Update to specific version

EOF
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--version)
            VERSION="$2"
            AUTO_DETECT=false
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

get_latest_pypi_version() {
    local package="$1"
    curl -s "https://pypi.org/pypi/${package}/json" | jq -r '.info.version'
}

get_pypi_info() {
    local package="$1"
    local version="$2"
    curl -s "https://pypi.org/pypi/${package}/${version}/json"
}

get_current_version() {
    grep 'version "' "$FORMULA_FILE" | sed 's/.*version "\([^"]*\)".*/\1/'
}

check_update_needed() {
    local target_version="$1"
    local current_version
    current_version=$(get_current_version)
    
    echo -e "${YELLOW}Current version: $current_version${NC}"
    echo -e "${YELLOW}Target version: $target_version${NC}"
    
    if [[ "$current_version" == "$target_version" ]]; then
        echo -e "${GREEN}No update needed - versions are the same${NC}"
        return 1
    else
        echo -e "${GREEN}Update needed - current: $current_version, target: $target_version${NC}"
        return 0
    fi
}

update_formula() {
    local version="$1"
    
    echo -e "${YELLOW}Fetching PyPI info for ${PYPI_PACKAGE}==${version}...${NC}"
    
    local pypi_json
    pypi_json=$(get_pypi_info "$PYPI_PACKAGE" "$version")
    
    if [[ -z "$pypi_json" ]] || [[ "$pypi_json" == "null" ]]; then
        echo -e "${RED}Error: Version $version not found on PyPI${NC}"
        exit 1
    fi
    
    local url sha256
    url=$(echo "$pypi_json" | jq -r '.urls[] | select(.packagetype == "sdist") | .url')
    sha256=$(echo "$pypi_json" | jq -r '.urls[] | select(.packagetype == "sdist") | .digests.sha256')
    
    if [[ -z "$url" ]] || [[ -z "$sha256" ]]; then
        echo -e "${RED}Error: Could not get URL or SHA256 from PyPI${NC}"
        exit 1
    fi
    
    echo -e "${YELLOW}URL: $url${NC}"
    echo -e "${YELLOW}SHA256: $sha256${NC}"
    
    echo -e "${YELLOW}Updating $FORMULA_FILE...${NC}"
    
    sed -i "s/version \".*\"/version \"${version}\"/" "$FORMULA_FILE"
    sed -i "s|url \".*\"|url \"${url}\"|" "$FORMULA_FILE"
    sed -i "s/sha256 \".*\"/sha256 \"${sha256}\"/" "$FORMULA_FILE"
    
    echo -e "${GREEN}Formula updated successfully!${NC}"
}

main() {
    echo -e "${GREEN}=== wechat-moments Formula Updater ===${NC}"
    
    if [[ "$AUTO_DETECT" == true ]]; then
        echo -e "${YELLOW}Auto-detecting latest version from PyPI...${NC}"
        VERSION=$(get_latest_pypi_version "$PYPI_PACKAGE")
        if [[ -z "$VERSION" ]] || [[ "$VERSION" == "null" ]]; then
            echo -e "${RED}Error: Failed to get latest version from PyPI${NC}"
            exit 1
        fi
    fi
    
    echo -e "${GREEN}Target version: $VERSION${NC}"
    
    if ! check_update_needed "$VERSION"; then
        echo -e "${GREEN}No update needed. Exiting.${NC}"
        exit 0
    fi
    
    update_formula "$VERSION"
    
    echo -e "${GREEN}Update completed successfully!${NC}"
}

main "$@"
