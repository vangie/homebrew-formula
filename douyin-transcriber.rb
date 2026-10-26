class DouyinTranscriber < Formula
  desc "CLI tool to transcribe Douyin video speech to text"
  homepage "https://github.com/vangie/douyin-transcriber"
  url "https://github.com/vangie/douyin-transcriber/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "65057b2871f950ba898f0787c7362d8f9969984105b952aafe3272c644cd67bd"
  license "MIT"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper-cpp"

  def install
    system "go", "build", *std_go_args(output: bin/"dyt", ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      dyt hears audio with a local ggml model and can rewrite the
      transcript with a chat model from Magpie or Ollama.

      Run `dyt --list` to see the models found on this machine.
      A remote speech service is a separate /v1/audio/transcriptions
      URL, set with --speech-url.
    EOS
  end

  test do
    system "#{bin}/dyt", "--help"
  end
end
