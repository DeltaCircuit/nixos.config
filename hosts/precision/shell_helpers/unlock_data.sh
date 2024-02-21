function unlock_data() {
    mkdir -p /data
    sudo cryptsetup luksOpen /dev/disk/by-uuid/b796945e-efcc-4ee7-b34a-ace3c7e4766e data
    sudo mount /dev/mapper/data /data
}

function lock_data() {
    sudo umount /data
    sudo cryptsetup luksClose data
}