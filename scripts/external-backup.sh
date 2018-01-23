#!/bin/bash

backup_location=/run/media/gianluca/ElementsGianluca/gianluca-backups
echo "Backing up personal documents in $backup_location"

echo "Backups..."
sudo rsync -a --info=progress2 --exclude=".cache" /mnt/green/backups $backup_location

echo "Docs..."
sudo rsync -a --info=progress2 --exclude=".cache" /mnt/green/Docs $backup_location

echo "Dropbox..."
sudo rsync -a --info=progress2 --exclude=".cache" /mnt/green/Dropbox $backup_location

echo "Images..."
sudo rsync -a --info=progress2 --exclude=".cache" /mnt/green/Images $backup_location
