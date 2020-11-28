#!/bin/bash
nd=$(date +%Y-%m-%d-%H%M)
for i in {1..9} ; do
btrfs subvolume delete /mnt/disk$i/snaps/$1
done
beep -f 500 ; beep -f 500 ; beep -f 500
