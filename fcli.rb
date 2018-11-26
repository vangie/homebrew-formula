class Fcli < Formula
  desc "Official Function Compute of Aliyun command-line interface"
  homepage "https://github.com/aliyun/fcli"
  version "0.27"
  url "https://gosspublic.alicdn.com/fcli/fcli-v#{version}-darwin-amd64.zip" 
  sha256 "d50e9028eafcbbc36bd923dd6f717c947c97b6529d8a7ccdf6cf4cc1c989f8f9"

  resource "bash_completion" do
    url "https://raw.githubusercontent.com/aliyun/fcli/master/misc/completion/fcli-completion.bash"
    sha256 "87975b3d120fff92bf2cff668c90641e9fd67d8d2e33aa54c58c27c6287bcfb9"
  end
  resource "zsh_completion" do
    url "https://raw.githubusercontent.com/aliyun/fcli/master/misc/completion/_fcli"
    sha256 "01ff7be3af72245bc3d0ae581aa2e29361b9ee7e625314ed54442b79c5665414"
  end

  def install
    bin.install "fcli"
    resource("bash_completion").stage { bash_completion.install "fcli-completion.bash" }
    resource("zsh_completion").stage { zsh_completion.install "_fcli" }
  end

  test do
    assert_match "fcli", shell_output("#{bin}/fcli help")
  end
end
