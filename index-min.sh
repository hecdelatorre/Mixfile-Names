#!/bin/bash
generate_random_string(){ tr -dc 'a-z0-9' </dev/urandom | head -c 4; }
read -p "Enter the directory path: " d
[ -d "$d" ]&&(cd "$d"||exit;fc=$(ls -1|wc -l);echo "Number of files in the directory: $fc";for f in *;do [ -f "$f" ]&&{ nn="$(generate_random_string) $f";mv "$f" "$nn";echo "Renamed: $f -> $nn";};done;echo "Renaming completed.")||echo "Error: The directory does not exist."
