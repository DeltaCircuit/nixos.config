function unlock_vault() {
    sudo mkdir -p /vault
    sudo cryptsetup luksOpen /dev/disk/by-uuid/cb8e523e-c9c2-4a8b-9fd4-045f3f466e2c vault
    sudo mount /dev/mapper/vault /vault
}

function lock_vault() {
    sudo umount /vault
    sudo cryptsetup luksClose vault
}