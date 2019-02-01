 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/aliyun/fun"
  version "2.10.1"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos-x64.zip"
  sha256 "b86ac910020f1b9d5ee378dfd7c1fab24ccf1f9857cf60a49f76f870c97801be"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
