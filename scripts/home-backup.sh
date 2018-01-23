#!/bin/bash

location=/mnt/green/backups/home/

echo "Backing up home directory in $location"

sudo rsync -a --info=progress2 --exclude=".cache" /home/gianluca/ $location
