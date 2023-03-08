class Kwt < Formula
    desc "Kubernetes Workstation Tools"
    homepage "https://github.com/vangie/kwt"
    version "v0.0.7"
  
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/vangie/kwt/releases/download/v0.0.7/kwt-darwin-arm64"
        sha256 "3da2dc6ad3f81dc6bae92264a8993f8364d5677d62e54428be80c6dda940a019"
      else
        url "https://github.com/vangie/kwt/releases/download/v0.0.7/kwt-darwin-amd64"
        sha256 "73818a12de9b9cedcb44e3974b42607ab704b51e85e3f896824392c803ee8360"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        url "https://github.com/vangie/kwt/releases/download/v0.0.7/kwt-linux-arm64"
        sha256 "69c477ae4c05c99ba2cb4604960679f998f4a93f6bbe19912c65eb917726fd1d"
      else
        url "https://github.com/vangie/kwt/releases/download/v0.0.7/kwt-linux-amd64"
        sha256 "eca99a85a9c01a5b71e198bbc1a39d0c23acbe307ec96441edced51a2193419f"
      end
    end
  
    def install
      bin.install stable.url.split("/")[-1] => "kwt"
    end
  
    test do
      system "#{bin}/kwt", "version"
    end
  end  