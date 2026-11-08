# Lab 4 — Partition, mirror, fail, recover

Pair: Zhiger                Driver first half: Zhiger
Machine: Laptop
Date: 08.11.2026

## Windows
Disk 0: partition style gpt, firmware_type UEFI — because window11 uses UEFI
New disk: partition style gpt — because firmware type is UEFI

## Linux layout — before

```
NAME                       SIZE TYPE FSTYPE      MOUNTPOINT
loop0                      1.5M loop squashfs    /snap/hwctl/123
loop1                     66.8M loop squashfs    /snap/core24/1643
loop2                      1.5M loop squashfs    /snap/hwctl/131
loop3                     50.1M loop squashfs    /snap/snapd/27710
sda                         20G disk             
├─sda1                       1M part             
├─sda2                     1.8G part ext4        /boot
└─sda3                    18.2G part LVM2_member 
  └─ubuntu--vg-ubuntu--lv   10G lvm  ext4        /
sdb                          2G disk             
sdc                          2G disk             
sdd                          2G disk             
sr0                        2.7G rom  iso9660  
```
## Linux layout — after the rebuild
```
NAME                       SIZE TYPE  FSTYPE            MOUNTPOINT
loop0                      1.5M loop  squashfs          /snap/hwctl/123
loop1                     66.8M loop  squashfs          /snap/core24/1643
loop2                      1.5M loop  squashfs          /snap/hwctl/131
loop3                     50.1M loop  squashfs          /snap/snapd/27710
sda                         20G disk                    
├─sda1                       1M part                    
├─sda2                     1.8G part  ext4              /boot
└─sda3                    18.2G part  LVM2_member       
  └─ubuntu--vg-ubuntu--lv   10G lvm   ext4              /
sdb                          2G disk                    
└─sdb1                       2G part  linux_raid_member 
  └─md0                      2G raid1 ext4              /mnt/mirror
sdc                          2G disk                    
└─sdc1                       2G part  linux_raid_member 
sdd                          2G disk                    
└─sdd1                       2G part  linux_raid_member 
  └─md0                      2G raid1 ext4              /mnt/mirror
sr0                        2.7G rom   iso9660          
```

| Role            | Device |
|-----------------|--------|
| Mirror half A   | sdb1   |
| Failed half     | sdc1   |
| Replacement     | sdd1   |

## The question
Your colleague deleted the wrong file from the mirror an hour ago.
Does RAID 1 help? Why?

No, RAID 1 does not help in this situation because it mirrors data between drives. When a file is deleted from one drive, the deletion is immediately replicated to the other drive. RAID 1 protects against drive failure, not accidental file deletion, so backups are necessary.

## Evidence

- [evidence/array-degraded.txt](evidence/array-degraded.txt) — shows the RAID array in a degraded state.
- [evidence/array-healthy.txt](evidence/array-healthy.txt) — shows the healthy RAID array.
- [evidence/array-rebuilt.txt](evidence/array-rebuilt.txt) — shows the RAID array after rebuilding.
- [evidence/checksum-after-failure.txt](evidence/checksum-after-failure.txt) — shows checksum results after disk failure.
- [evidence/checksum-before.txt](evidence/checksum-before.txt) — shows checksum results before disk failure.
- [evidence/disk-layout.txt](evidence/disk-layout.txt) — shows the disk partition and layout information.
- [evidence/lsblk-before.txt](evidence/lsblk-before.txt) — shows the block device layout before disk failure.
