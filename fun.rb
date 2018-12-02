 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/aliyun/fun"
  version "2.7.0"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos-x64.zip"
  sha256 "e76a7e38a1920f61d8026ec4770404c2a55e06d567ffd91e10822c6146488b01"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
