#!/usr/bin/env bash

# Usage ./convert_images.sh -f <target_folder> -u <target_bucket> 

set -e

target_dir=''
bucket_name=''

while getopts "f:u:" opt; do
  case "$opt" in
  f)
    target_dir=${OPTARG%/} # remove trailing args
    ;;
  u)
    bucket_name=$OPTARG
    ;;
  esac
done


if [ -z "$target_dir" ]; then
  echo "Error: folder name not supplied"
  exit
fi

if [ ! -d "$target_dir" ]; then
    echo "Error: provided directory does not exist"
  exit
fi

echo "converting images in \"${target_dir}\""

declare -a sizes
sizes=(380 480 700)

# create a new folder called `web`
if [ ! -d "$target_dir/web" ]; then
  mkdir "$target_dir/web"
fi

# convert to other image sizes
function resize() {
  nconvert -o "${1}/web/%_${2}w.jpg" -overwrite -ratio -rtype lanczos -rflag decr -resize "${2}" 0 "${1}"/*.jpg
}
export -f resize

parallel resize ::: "$target_dir" :::  "${sizes[@]}"

if [ ! -z "$bucket_name" ]; then
  gsutil -m cp "$target_dir"/web/*.jpg gs://"$bucket_name"
fi