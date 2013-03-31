require 'formula'

class GroovySdk < Formula
  homepage 'http://groovy.codehaus.org/'
  url 'http://dist.groovy.codehaus.org/distributions/groovy-sdk-2.1.2.zip'
  sha1 '9c85239f99c74c42e56a488acede73298c8970a1'

  def install
    # Don't need Windows files.
    # Why are icons in bin?
    rm_f Dir["bin/*.bat","bin/groovy.{icns,ico}"]

    prefix.install_metafiles
    libexec.install %w(bin conf lib embeddable src)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<-EOS.undent
      You should set the environment variable GROOVY_HOME to
        #{libexec}
    EOS
  end
end
