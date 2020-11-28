#!/bin/bash
nd=$(date +%Y-%m-%d-%H%M)
for i in {1..9} ; do
btrfs sub snap -r /mnt/disk$i/$1 /mnt/disk$i/snaps/$1_$nd
done
beep -f 500 ; beep -f 500 ; beep -f 500
