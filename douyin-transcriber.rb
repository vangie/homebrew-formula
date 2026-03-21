class DouyinTranscriber < Formula
  desc "CLI tool to transcribe Douyin video speech to text"
  homepage "https://github.com/vangie/douyin-transcriber"
  url "https://github.com/vangie/douyin-transcriber/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "727b70487d141cc5863a5de88f5405f16e7337a48115126b2d2ea7325ef32475"
  license "MIT"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  def install
    system "go", "build", *std_go_args(output: bin/"dyt", ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      For local transcription mode, install whisper.cpp:
        brew install whisper-cpp

      Cloud mode requires OPENAI_API_KEY.
    EOS
  end

  test do
    system "#{bin}/dyt", "--help"
  end
end
