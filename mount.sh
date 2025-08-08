#!bin/bash

DEVICE="/dev/sdb1"
MOUNT_POINT="/mnt/data"

# verify if si mount!

if  mountpoint -q " $MOUNT_POINT"; then
	echo "$MOUNT_POINT is mount!!"
else 
	echo "mount  $DEVICE in $MOUNT_POINT.."
	sudo mount "$DEVICE" "MOUNT_POINT"
	if [$? -eq 0]; then 
		echo "mount succed"
	else
		echo" error in mount!"
	fi
fi
