#!/bin/bash

# Function to generate a string of 4 random characters (lowercase letters and numbers)
generate_random_string() {
  tr -dc 'a-z0-9' < /dev/urandom | head -c 4
}

# Ask for a directory
read -p "Enter the directory path: " directory

# Check if the directory exists
if [ -d "$directory" ]; then
  # Enter the directory
  cd "$directory" || exit

  # Count the number of files
  file_count=$(ls -1 | wc -l)
  echo "Number of files in the directory: $file_count"

  # Rename files with the specified pattern
  for file in *; do
    if [ -f "$file" ]; then
      new_name="$(generate_random_string) $file"
      mv "$file" "$new_name"
      echo "Renamed: $file -> $new_name"
    fi
  done

  echo "Renaming completed."

else
  echo "Error: The directory does not exist."
fi
