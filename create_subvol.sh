#!/bin/bash
# arg sharename
for i in {1..9} ; do
    if [ ! -d "/mnt/disk$i/snaps" ]; then
        echo "Snaps dir not found, creating..."
        mkdir /mnt/disk$i/snaps
    fi
    read -p "Press [Enter] key to start move for disk$i/$1"
    mv /mnt/disk$i/$1 /mnt/disk$i/$1_temp
    read -p "Press [Enter] key to create subvolume disk$i/$1"
    btrfs sub create /mnt/disk$i/$1
    read -p "Press [Enter] key to start copy back fronm temp for disk$i/$1"
    cp -aT --reflink=always /mnt/disk$i/$1_temp /mnt/disk$i/$1
    echo "Remember to delete disk$i/$1_temp."
done
