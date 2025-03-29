# Homebrew Formula

A collection of Homebrew formulas for various tools.

## Available Formulas

### subscan

A command-line tool for extracting hardcoded subtitles from videos, designed for macOS. It uses OCR technology to recognize text from video frames.

Features:

- Extract hardcoded subtitles from any video format supported by ffmpeg
- Crop specific areas of video frames for targeted subtitle extraction
- Support multiple languages (including Chinese and English)
- Adjustable frame rate for balancing accuracy and speed

### Other Tools

- `fcli`: Official Function Compute of Aliyun command-line interface
- `fun`: Development tool for serverless applications of aliyun
- `ossutil`: Command line interface of OSS of aliyun
- `gost`: GO Simple Tunnel - a simple tunnel written in golang
- `shadowsocksr-libev`: A fast and secure SOCKS5 proxy with Shadowsocks and ShadowsocksR support

## Installation

```bash
# Add the tap
brew tap vangie/formula

# Install subscan
brew install subscan

# Install other tools
brew install fcli
brew install fun
brew install ossutil
brew install gost
brew install shadowsocksr-libev
```

## Requirements

### subscan

- macOS 10.15 (Catalina) or later
- ffmpeg (automatically installed by Homebrew)
