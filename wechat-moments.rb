class WechatMoments < Formula
  version "0.1.0"
  desc "Post to WeChat Moments via ADB automation"
  homepage "https://github.com/vangie/wechat-moments"
  url "https://files.pythonhosted.org/packages/a6/db/c7823575ae757e8e84d4f1db243c292f08326da086c1f9f4c702a2c193ae/wechat_moments-#{version}.tar.gz"
  sha256 "9412f8d5eca2f7b127ecef968c3d833a6a2d5cc351a590e467b28d6ddfcc301e"
  license "MIT"

  depends_on "python@3.12"
  depends_on "pipx"

  def install
    system "pipx", "install", "wechat-moments==#{version}",
           "--python", Formula["python@3.12"].opt_bin/"python3.12"
    bin.install_symlink Dir["#{HOMEBREW_PREFIX}/bin/wx-pyq*"]
  end

  test do
    system bin/"wx-pyq", "--help"
  end
end
