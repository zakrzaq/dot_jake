#!/bin/bash

# Specify the default video extension
default_extension="mov"

# Get the video extension from the command line arguments or use the default
video_extension="${1:-$default_extension}"

# Specify the directory containing the *."$video_extension" files
input_directory="./"

# Specify the output directory for the video-only files
output_directory="./video_only"

# Ensure the output directory exists
mkdir -p "$output_directory"

# Process each *."$video_extension" file in the input directory
shopt -s nocaseglob # Enable case-insensitive globbing
for input_file in "$input_directory"/*."$video_extension"; do
    # Extract video only (remove audio) and save to the output directory
    output_file="$output_directory/$(basename "$input_file" ".$video_extension").$video_extension"
    ffmpeg -i "$input_file" -an -c:v copy "$output_file"
    echo "Processed: $input_file"
done
shopt -u nocaseglob # Disable case-insensitive globbing

echo "Conversion complete."

