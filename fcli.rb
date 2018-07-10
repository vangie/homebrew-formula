class Fcli < Formula
  desc "The command line interface of function compute of aliyun."
  homepage "https://github.com/aliyun/fcli"
  version "0.20"
  url "https://gosspublic.alicdn.com/fcli/fcli-v#{version}-darwin-amd64.zip" 
  sha256 "07c6fb5f1697352981707347bebb6902f95291b957b4b15e6d3203a8ceaff2eb"

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
    system "false"
  end
end
