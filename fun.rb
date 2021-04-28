 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/alibaba/funcraft"
  version "3.6.22"
  url "http://funcruft-release.oss-accelerate.aliyuncs.com/fun/fun-v#{version}-macos.zip"
  sha256 "fea656d21e8a71c8b24a40d75977405d371a50ad666475f341f5226309085600"

  def install
    bin.install "fun-v#{version}-macos" => "fun"
  end

  test do
    system "false"
  end
end
