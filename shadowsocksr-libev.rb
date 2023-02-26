class ShadowsocksrLibev < Formula
  desc "A fast and secure SOCKS5 proxy with Shadowsocks and ShadowsocksR support"
  homepage "https://github.com/tindy2013/shadowsocks-static-binaries"
  url "https://github.com/tindy2013/shadowsocks-static-binaries/raw/master/shadowsocksr-libev/macos/ssr-local"
  version "latest"
  sha256 "8de9b3f59a839ca01177e8e7dc54cc50314f6a04adafd13871ade29c3d98c31f"

  def install
    bin.install "ssr-local"
  end

  test do
    assert_match "usage: ssr-local", shell_output("#{bin}/ssr-local --help 2>&1", 1)
  end
end
