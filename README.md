# Homebrew Formula

A collection of Homebrew formulas for various tools.

## Available Formulas

### wechat-moments

Post to WeChat Moments via ADB automation. Controls an Android phone running WeChat using a deterministic FSM.

### subscan

A command-line tool for extracting hardcoded subtitles from videos, designed for macOS. It uses OCR technology to recognize text from video frames.

Features:

- Extract hardcoded subtitles from any video format supported by ffmpeg
- Crop specific areas of video frames for targeted subtitle extraction
- Support multiple languages (including Chinese and English)
- Adjustable frame rate for balancing accuracy and speed

### douyin-transcriber

CLI tool to transcribe Douyin (抖音) video speech to text.

Runtime dependencies:
- `ffmpeg`
- `yt-dlp`

Optional for local mode:
- `whisper-cpp`

### Other Tools

- `git-assist`: Git assistant tool
- `shadowsocksr-libev`: A fast and secure SOCKS5 proxy with Shadowsocks and ShadowsocksR support

## Installation

```bash
# Add the tap
brew tap vangie/formula

# Install wechat-moments
brew install wechat-moments

# Install subscan
brew install subscan

# Install douyin-transcriber
brew install douyin-transcriber

# Install other tools
brew install git-assist
brew install shadowsocksr-libev
```

## Requirements

### wechat-moments

- Python 3.12+
- pipx
- Android phone with USB debugging enabled

### subscan

- macOS 10.15 (Catalina) or later
- ffmpeg (automatically installed by Homebrew)
