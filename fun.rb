 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/alibaba/funcraft"
  version "3.3.0"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos.zip"
  sha256 "9c9f0e94b3b6cd0ba268ee4146a2489c1763c00d7d194d850e3e82116040df90"


  def install
    bin.install "fun-v#{version}-macos" => "fun"
  end

  test do
    system "false"
  end
end
