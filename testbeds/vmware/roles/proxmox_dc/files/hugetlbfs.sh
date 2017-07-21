#!/bin/bash

case "$1" in
    setup)
        mkdir -p /mnt/huge
        (mount | grep hugetlbfs) > /dev/null || mount -t hugetlbfs nodev /mnt/huge
        for i in {0..7}
        do
            if [[ -e "/sys/devices/system/node/node$i" ]]
            then
                echo $2 > /sys/devices/system/node/node$i/hugepages/hugepages-2048kB/nr_hugepages
            fi
        done
        ;;
    cleanup)
        for i in {0..7}
        do
            if [[ -e "/sys/devices/system/node/node$i" ]]
            then
                echo 0 > /sys/devices/system/node/node$i/hugepages/hugepages-2048kB/nr_hugepages
            fi
        done
        umount -a -t hugetlbfs
        rm -rf /mnt/huge
        ;;
esac