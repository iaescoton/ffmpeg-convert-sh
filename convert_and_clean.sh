#!/bin/zsh

# Check if a filename was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename without extension>"
  exit 1
fi

# Extract filename
filename="$1"
input_file="${filename}.mov"
output_file="${filename}.mp4"

# Convert the video with reduced resolution
if ffmpeg -i "$input_file" -vcodec h264 -acodec aac -vf "scale=1280:720" "$output_file"; then
  echo "Conversion successful, removing the original file."
  rm "$input_file"
else
  echo "Conversion failed, original file not deleted."
fi