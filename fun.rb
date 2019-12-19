 class Fun < Formula
  desc "Fun is a development tool for serverless applications of aliyun."
  homepage "https://github.com/alibaba/funcraft"
  version "3.2.2"
  url "https://gosspublic.alicdn.com/fun/fun-v#{version}-macos.zip"
  sha256 "a11e7542342c5fe8682dfa1f806f1fae48e404683eb3501bbf2469aae7a94f9d"


  def install
    bin.install "fun-v#{version}-macos" => "fun"
  end

  test do
    system "false"
  end
end
