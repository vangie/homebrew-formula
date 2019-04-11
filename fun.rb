 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/aliyun/fun"
  version "2.11.2"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos-x64.zip"
  sha256 "fa19a92f15e5d024460d37f8490159c784a46b7e3af424d07f1633e9a66dab03"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
