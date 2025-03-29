class Subscan < Formula
  version "1.0.0"
  desc "Command-line tool for extracting hardcoded subtitles from videos"
  homepage "https://github.com/vangie/subscan"
  url "https://github.com/vangie/subscan/releases/download/v#{version}/subscan-#{version}.tar.gz"
  sha256 "8662de3491d38dc32512d06ee3759c78f4ae0646c45b18cf84701019b15e4069"
  license "Apache-2.0"

  depends_on :macos => :catalina # macOS 10.15 or later
  depends_on "ffmpeg"

  def install
    # Install scripts to libexec
    libexec.install Dir["bin/*"]

    # Create symlinks in bin directory without extensions
    bin.install_symlink libexec/"subscan.sh" => "subscan"
    bin.install_symlink libexec/"crop.sh" => "crop"
    bin.install_symlink libexec/"framify.sh" => "framify"
    bin.install_symlink libexec/"ocr.swift" => "ocr"
  end

  test do
    system "#{bin}/subscan", "--help"
  end
end 