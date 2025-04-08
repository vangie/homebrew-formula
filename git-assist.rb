class GitAssist < Formula
  version "0.0.1"
  desc "Command-line tool for enhancing Git workflow with AI-powered assistance"
  homepage "https://github.com/vangie/git-assist"
  url "https://github.com/vangie/git-assist/releases/download/v#{version}/git-assist-#{version}.tar.gz"
  sha256 "db78cae59bbd5a535307345effbd03ba8ba9d055f05adc2de3a8863fd7d05ec7"
  license "Apache-2.0"

  depends_on :macos => :catalina # macOS 10.15 or later
  depends_on "git"

  def install
    # Install directories to libexec
    libexec.install "bin"
    libexec.install "lib"
    libexec.install "prompts"

    # Create symlinks in bin directory for the main commands
    bin.install_symlink libexec/"bin/git-gen"
    bin.install_symlink libexec/"bin/git-up"
    bin.install_symlink libexec/"bin/git-assist-model"
    bin.install_symlink libexec/"bin/git-assist-prompt"
    bin.install_symlink libexec/"bin/git-assist-llm"
  end

  test do
    system "#{bin}/git-gen", "--help"
  end
end 