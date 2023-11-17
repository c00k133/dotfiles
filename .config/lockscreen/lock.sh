#!/usr/bin/env bash

COLOR_NAME='background'
XRDB_COLOR_LINE=($(xrdb -query | grep "${COLOR_NAME}"))
COLOR_HEX=$(echo "${XRDB_COLOR_LINE[1]}" | sed 's/#//g')

# https://unix.stackexchange.com/a/19656
SCRIPT_NAME="$(realpath $0)"
IMAGE_FILE="${SCRIPT_NAME%.sh}.png"

i3lock \
    --show-failed-attempts \
    --color="${COLOR_HEX}" \
    --image="${IMAGE_FILE}"
