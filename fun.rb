 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/aliyun/fun"
  version "2.1.0"
  url "https://github.com/aliyun/fun/releases/download/v#{version}/fun-v#{version}-macos-x64"
  sha256 "61b90ed79524a020eeb4d9f3806ad7ff908756f0e8aaa53d0b487fb6374d6392"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
