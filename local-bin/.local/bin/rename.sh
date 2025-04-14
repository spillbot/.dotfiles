#!/bin/bash

# Initialize a counter
i=0

# Get the current directory
current_dir=$(pwd)

# Loop through all files in the directory, excluding the script itself
for file in "$current_dir"/*; do
    # Skip the script itself
    if [[ "$file" == "$current_dir/rename.sh" ]]; then
        continue
    fi

    # Increment the counter
    ((i++))

    # Extract the file extension (if any)
    base=$(basename "$file")
    extension="${base##*.}"
    filename="${base%.*}"

    # Generate a new filename with a consistent naming pattern
    new_filename="km_$(printf "%.4d" "$i").$extension"

    # Rename the file
    mv "$file" "$new_filename"
done
