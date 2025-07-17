#!/bin/bash

ext_from="$1"
ext_to="$2"

echo "You provided ext: $ext_from"
echo "to rename to ext: $ext_to"
echo "and option: $3"

counter=1
mask="*${ext_from}"

for file in $mask; do
  echo "Processing file $counter: $file"
  #new_name="${counter}{$ext_to}"
  new_name="${file/$ext_from/$ext_to}"
  if [ "$3" == "--run" ]; then
    echo "Renaming '$file' to '$new_name'"
    mv "$file" "$new_name"
  else
    echo "Dry run rename '$file' to '$new_name'"
  fi
  ((counter++))
done
