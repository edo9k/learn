#!/bin/bash

function whatsappvideo {
    # Define the video capture directory (localized in Portuguese)
    capture_dir="$(xdg-user-dir VIDEOS)/Gravações de tela"

    # Check if the directory exists
    if [ -d "$capture_dir" ]; then
        cd "$capture_dir" || { echo "Failed to access $capture_dir"; return 1; }

        # Loop through all .webm files in the folder
        for file in *.webm; do
            if [ -f "$file" ]; then
                # Define output file name
                output="${file%.webm}.mp4"

                # Convert the file without changing the scale
                ffmpeg -i "$file" -c:v libx264 -c:a aac -strict -2 "$output"

                # If the conversion was successful, delete the original .webm file
                if [ $? -eq 0 ]; then
                    rm "$file"
                    echo "Converted and deleted: $file"
                else
                    echo "Failed to convert: $file"
                fi
            else
                echo "No .webm files found in $capture_dir."
            fi
        done
    else
        echo "Capture folder not found!"
        return 1
    fi
}

