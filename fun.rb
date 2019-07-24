 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/alibaba/funcraft"
  version "2.15.1"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos-x64.zip"
  sha256 "6b55b823e70bd9c04ba70d2baa2ad09e943901ef7a3dc800aec0b9fb3f92a132"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
