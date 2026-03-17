class WechatMoments < Formula
  version "0.1.1"
  desc "Post to WeChat Moments via ADB automation"
  homepage "https://github.com/vangie/wechat-moments"
  url "https://files.pythonhosted.org/packages/95/b7/5cd0571341ad974768e0ab50b34ff834b04515e8acc7e5ea91afb76d2d00/wechat_moments-0.1.1.tar.gz"
  sha256 "9b85c829a99d96811d2d4b910cdebc9f56522a947c8b4bf1c566fd928f1b2e20"
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
