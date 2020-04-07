 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/alibaba/funcraft"
  version "3.6.8"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos.zip"
  sha256 "d579f83ebb1e46e1a072302e468fa7aaf3b284319b564101fb18f4f9023db938"


  def install
    bin.install "fun-v#{version}-macos" => "fun"
  end

  test do
    system "false"
  end
end
