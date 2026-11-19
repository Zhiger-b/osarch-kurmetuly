## 1a
| Figure          |             This computer             |       COmmand        |
| :-------------- | :-----------------------------------: | :------------------: |
| cpu model       |            Intel i5-6300U             |        lscpu         |
| core count      |                   2                   |        lscpu         |
| thread count    |                   4                   |        lscpu         |
| virtualization  |                 VT-x                  |        lscpu         |
| memory          |             7.6Gi / 4.6Gi             |       free -h        |
| system disk     |      476G, 385G, NVMe M.2 (SSD)       |       lsblk -d       |
| partition style |              UEFI (GPT)               | ls /sys/firmware/efi |
| OS and version  | Fedora Linux 45 (Workstation Edition) |    lsb_release -a    |

## 1b
1. This laptop could run both guests, but does not mean it should. Spec wise my laptop and this one are quite similar: same number of threads, memory. Just my has 2.4GHz and 400+Gigabytes of storage. However this laptop runs win11, which will eat a lot of resources. Yeah, we can promise guests more that we can give, but it will slow down them and the host
2. Hardware wise it can't be upgraded. On laptops cpu is soldered on the board, and in this case memory, storage are soldered too. Only thing I can recommend is changing OS. After installing fedora my laptop got second life, so changing win11 is the solution.



