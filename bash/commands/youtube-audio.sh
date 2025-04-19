#!/bin/bash

# requires yt-dlp (youtube downloader) 

youtube_audio() {
  yt-dlp \
    --ignore-errors \
    --output "%(title)s.%(ext)s" \
    --extract-audio \
    --audio-format mp3 "$@"
}

