 class Gost < Formula
  desc "GO Simple Tunnel - a simple tunnel written in golang"
  homepage "https://github.com/ginuerzh/gost"
  version "2.8.1"
  url "https://github.com/ginuerzh/gost/releases/download/v#{version}/gost_2.8.1_darwin_amd64.zip"
  sha256 "cb5cbdff1b012fc9407a62c7916ea4a14decb06e54bed3a0c4c587322bd7c4fd"


  def install
    bin.install "gost"
  end

  test do
    system "false"
  end
end
