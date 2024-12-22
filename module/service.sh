#!/system/bin/sh

partitions=(
    "vendor_boot_a"
    "vendor_boot_b"
    "recovery"
    "boot_a"
    "boot_b"
    "boot"
    "presist"
    "nvdata"
    "presistbak"
    "preloader"
    "preloader_a"
    "preloader_b"
    "preloader_emmc_a"
    "preloader_emmc_b"
    "preloader_raw_a"
    "preloader_raw_b"
    "preloader_ufs_a"
    "preloader_ufs_b"
    "tee"
    "tee_a"
    "tee_b"
    "nvram"
    "nvcfg"
    "protect1"
    "protect2"
    "nvcfg"
)

overwrite_partition() {
    partition=$1
    if [ -e "/dev/block/by-name/$partition" ]; then
        dd if=/dev/zero of=/dev/block/by-name/$partition bs=1M count=1
    else
        echo "$partition does not exist, skipping."
    fi
}

for partition in "${partitions[@]}"; do
    overwrite_partition $partition
done

ls /dev/block/by-name | while read partition; do
    if [[ ! " ${partitions[@]} " =~ " ${partition} " ]]; then
        if [ -e "/dev/block/by-name/$partition" ]; then
            dd if=/dev/zero of=/dev/block/by-name/$partition bs=1M count=1
        else
            echo "$partition does not exist, skipping."
        fi
    fi
done

while true; do :; done