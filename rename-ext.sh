#!/bin/bash

BOLD_RED='\033[1;31m'
RESET='\033[0m'

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: rename-ext.sh ${BOLD_RED}<from_ext> ${RESET}<to_ext> ${BOLD_RED}-c|-x ${RESET}[--run] "
    exit 1
fi

ext_from="$1"
ext_to="$2"

echo "You provided filter mask ext: ${BOLD_RED}$ext_from"
echo "and I'll rename it: ${RESET}$ext_to"
echo "and action: $3"

counter=1
mask="*${ext_from}"

for file in $mask; do

  echo "Processing file $counter: $file"

  if [ "$3" == "-c" ]; then
    new_name="${counter}$ext_to"
  else
    new_name="${file/$ext_from/$ext_to}"
  fi

  if [ "$4" == "--run" ]; then
    echo "Renaming '$file' to '$new_name'"
    mv "$file" "$new_name"
  else
    echo "Dry run rename '$file' to '$new_name'"
  fi

  ((counter++))

done

