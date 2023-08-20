#!/bin/bash

thumbnail_directory="thumbnails/"
mkdir -p "$thumbnail_directory"

find . -type f -name "*.mp4" | while IFS= read -r video_file; do
    # Get the relative file path without leading "./"
    relative_path=${video_file#./}
    # Replace "/" in the relative file path with "_"
    filename_with_underscore="${relative_path//\//_}"

    thumbnail_file="${thumbnail_directory}${filename_with_underscore}.jpg"

    # Get duration of video in seconds
    duration=$(docker run --rm -v "$(pwd):$(pwd)" -w "$(pwd)" jrottenberg/ffmpeg:latest-data-1 -i "$video_file" 2>&1 | grep Duration | awk '{print $2}' | tr -d , | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')

    # Calculate the frame rate needed to get 18 (3x6 tiles) frames evenly throughout the video
    # Using awk for floating point calculation
    frame_rate=$(echo "$duration 18" | awk '{printf "%.5f", $2 / $1}')

    # Adjust the select filter to use the calculated frame rate and scale
    docker run --rm -v "$(pwd):$(pwd)" -w "$(pwd)" jrottenberg/ffmpeg:latest-data-1 -i "$video_file" -frames 1 -vf "fps=fps=$frame_rate,scale=320:-1,tile=3x6" "$thumbnail_file"
done
