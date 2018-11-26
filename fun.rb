 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/aliyun/fun"
  version "2.6.1"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos-x64.zip"
  sha256 "90052c73abe19e4d425916f367391100ffe76bfaba7c2d81e2f74af749c6a1d0"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
