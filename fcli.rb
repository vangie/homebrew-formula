class Fcli < Formula
  desc "Official Function Compute of Aliyun command-line interface"
  homepage "https://github.com/aliyun/fcli"
  version "1.0.4"
  url "https://gosspublic.alicdn.com/fcli/fcli-v#{version}-darwin-amd64.zip" 
  sha256 "a12a750cb62426e3d4e1369a1ecd8703f2116c8651bfab589ee072f0384d43ee"

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
