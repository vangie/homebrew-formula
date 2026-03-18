class WechatMoments < Formula
  version "0.1.2"
  desc "Post to WeChat Moments via ADB automation"
  homepage "https://github.com/vangie/wechat-moments"
  url "https://files.pythonhosted.org/packages/a4/39/35375526e6055d3040a556b3c81f571b32228b64cad886ee0fb26cbed96d/wechat_moments-0.1.2.tar.gz"
  sha256 "942a264cc1bc28779b45aba53e9945eccb422fc7a86465802ab69c958f5a9154"
  license "MIT"

  depends_on "python@3.12"
  depends_on "pipx"
  depends_on "tesseract" # for pytesseract OCR

  def caveats
    <<~EOS
      This formula requires Android Platform Tools (adb).
      Install it with:
        brew install --cask android-platform-tools
    EOS
  end

  def install
    ENV["PIPX_HOME"] = libexec/"pipx"
    ENV["PIPX_BIN_DIR"] = libexec/"bin"
    system "pipx", "install", "wechat-moments==#{version}",
           "--python", Formula["python@3.12"].opt_bin/"python3.12"
    bin.install_symlink Dir[libexec/"bin"/"wx-pyq*"]
  end

  test do
    system bin/"wx-pyq", "--help"
  end
end
