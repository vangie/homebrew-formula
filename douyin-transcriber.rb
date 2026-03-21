class DouyinTranscriber < Formula
  desc "CLI tool to transcribe Douyin video speech to text"
  homepage "https://github.com/vangie/douyin-transcriber"
  url "https://github.com/vangie/douyin-transcriber/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "253978ad4cbbafbd0a278100e0c68fa3318d91ef3896e362fb7bb04af5551762"
  license "MIT"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper-cpp"

  def install
    system "go", "build", *std_go_args(output: bin/"dyt", ldflags: "-s -w -X main.version=#{version}")
  end

  def caveats
    <<~EOS
      Cloud mode requires OPENAI_API_KEY environment variable.
      Without it, dyt defaults to local mode using whisper.cpp.

      Note: yt-dlp is no longer required. dyt downloads directly
      from Douyin's CDN without cookies or login.
    EOS
  end

  test do
    system "#{bin}/dyt", "--help"
  end
end
