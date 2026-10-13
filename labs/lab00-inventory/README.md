# Lab 0 — Inventory your own machine

Pair: Zhiger      Driver first half: Zhiger
Machine: Acer laptop
Date: 10-10-2026

## What I did

Steps, with commands in code blocks. Not prose about the steps.

```
<command>
<output, trimmed>
```

```
<lscpu>
```
```
<df -h>
```
```
<sudo dmidecode -t memory>
```
```
<sudo dmidecode -t bios>
```
```
<lscpu | grep -i "VIrtualization">
```
```
<lsblk -d>
```
```
<ls /sys/firmware/efi>
```

## Result

| What | Value | Where I got it |
| :--- | :---: | :---:|
| cpu model | Intel i5-6300U | lscpu |
| core count | 2 | lscpu |
| thread count | 4 | lscpu |
| total memory | 7.6Gi | free -h |
| number of modules | 2 | sudo dmidecode -t memory |
| memory speed | 2133 MT/s | sudo dmidecode -t memory |
| disk type | NVMe | lsblk -d |
| free space | 86G | df -h |
| firmware type | UEFI | ls /sys/firmware/efi |
| version | V1.05 | sudo dmidecode -t bios |
| date | 10/25/2019 | sudo dmidecode -t bios |
| virtualization | VT-x | lscpu | grep -i "Virtualization" |

## What did not work the first time

sudo dmidecode -t memory did not work first time. I had to install dmidecode to make it work.

## Evidence

- [evidence/cpu.txt](evidence/cpu.txt) — cpu model,core, thread count
- [evidence/memory.txt](evidence/memory.txt) — total ram memory, number of modules, their speed
- [evidence/freespace.txt](evidence/freespace.txt) — disk type, free space
- [evidence/virtucheck.txt](evidence/virtucheck.txt) — hardware virtualization check
- [evidence/firmwaretype.txt](evidence/firmwaretype.txt) — chech if bios or uefi
- [evidence/biosver.txt](evidence/biosver.txt) — bios version
