#!/bin/bash 

# requires ffmpeg 

split_mp3() {
  local input_file="$1"
  local minutes="$2"
  local duration="00:$(printf "%02d" "$minutes"):00"
  local base_name=$(basename "$input_file" | sed 's/\.[^.]*$//')

  ffmpeg -i "$input_file" -c:a libmp3lame -segment_time "$duration" -f segment "${base_name}_%03d.mp3"
}

