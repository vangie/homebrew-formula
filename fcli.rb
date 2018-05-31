# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
 class Fcli < Formula
  desc "The command line interface of function compute of aliyun."
  homepage "https://github.com/aliyun/fcli"
  version "0.18"
  url "https://gosspublic.alicdn.com/fcli/fcli-v#{version}-darwin-amd64.zip" 
  sha256 "fa9f3b7b1e035f0d15596f9e767d712e994f73134e68a9799d92985b1c137f3c"

  resource "bash_completion" do
    url "https://raw.githubusercontent.com/aliyun/fcli/master/misc/completion/fcli-completion.bash"
    sha256 "f8ef4d2843bb5ca261f3c0735d2b40e52fccba639f92f2601a92e3cf6224195a"
  end
  resource "zsh_completion" do
    url "https://raw.githubusercontent.com/aliyun/fcli/master/misc/completion/_fcli"
    sha256 "2e28f81c0f15fddab6f9ef8976bfd6dff2325f51eca6b9e9dc5fd8f48278c651"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    bin.install "fcli"
    resource("bash_completion").stage { bash_completion.install "fcli-completion.bash" }
    resource("zsh_completion").stage { zsh_completion.install "_fcli" }
  end

   test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test fcli-v0.14-darwin-amd`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
