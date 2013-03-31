require 'formula'

class Gradle < Formula
  homepage 'http://www.gradle.org/'
  url 'http://services.gradle.org/distributions/gradle-1.5-all.zip'
  sha1 'aaf6e2392c078381fa398874e39b4056559a6c63'

  def install
    libexec.install %w[bin lib src]
    bin.install_symlink libexec+'bin/gradle'
  end
end
