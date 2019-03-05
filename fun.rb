 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/aliyun/fun"
  version "2.10.2"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos-x64.zip"
  sha256 "6325d9a2cfcf75607d1ba2b03403c4077d0eb48988c7af1665ad3398b9a99716"


  def install
    bin.install "fun-v#{version}-macos-x64" => "fun"
  end

  test do
    system "false"
  end
end
