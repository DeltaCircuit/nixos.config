#!/run/current-system/sw/bin/bash  

export DISPLAY=":0"
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

notify-send -u critical -t 1500 -a "EnteCloud Network" "Offsite Backup" "Started backing up camera roll"
DEVICE=$1
echo "USB Drive inserted: $DEVICE" >> /home/giri/usblog.txt

notify-send -u critical -t 1500 -a "EnteCloud Network" "Offsite Backup" "Started backing up camera roll"
