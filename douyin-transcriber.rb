class DouyinTranscriber < Formula
  desc "CLI tool to transcribe Douyin video speech to text"
  homepage "https://github.com/vangie/douyin-transcriber"
  url "https://github.com/vangie/douyin-transcriber/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "4d0be9f86bd94188565e00fed0c0dfe5ce043ada8cbedc96f065728f0db70af5"
  license "MIT"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper-cpp"

  def install
    system "go", "build", *std_go_args(output: bin/"dyt", ldflags: "-s -w -X main.version=#{version}")
    (pkgshare/"raycast").install Dir["raycast/*"]
  end

  def post_install
    return unless raycast_installed?

    extension = Pathname.new(Dir.home)/".config/raycast/extensions/douyin-transcript"
    extension.mkpath
    source = pkgshare/"raycast"
    cd source do
      system "npm", "install", "--silent"
      system "npx", "--no-install", "ray", "build", "-e", "dist", "-o", extension, "-I"
    end
    ohai "Raycast extension installed", extension
  end

  def caveats
    <<~EOS
      dyt hears audio with a local ggml model and can rewrite the
      transcript with a chat model from Magpie or Ollama.

      Run `dyt --list` to see the models found on this machine.
      A remote speech service is a separate /v1/audio/transcriptions
      URL, set with --speech-url.

      If Raycast is installed, the Douyin Transcript extension is
      imported on install. Open Raycast and search for it.
    EOS
  end

  def raycast_installed?
    File.exist?("/Applications/Raycast.app") || File.exist?(File.expand_path("~/Applications/Raycast.app"))
  end

  test do
    system "#{bin}/dyt", "--help"
  end
end
