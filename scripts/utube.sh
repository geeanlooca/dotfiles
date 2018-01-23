#!/bin/bash

URL=$1

if [ $2 ];
then
    QUALITY=$2
else
    QUALITY=480;
    echo "Quality set to 480p"
fi

mpv --ytdl-format="bestvideo[ext=mp4][height<=?${QUALITY}]+bestaudio[ext=m4a]" $URL
