 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/alibaba/funcraft"
  version "3.0.4"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos.zip"
  sha256 "ee9a75cbfe754e4cdf48a53f894d1fdac0a5d8dd7c3a42f52a37be137f96a256"


  def install
    bin.install "fun-v#{version}-macos" => "fun"
  end

  test do
    system "false"
  end
end
