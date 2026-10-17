# Lab 1 — Your first virtual machine

Pair: Zhiger                Driver first half: Zhiger
Machine: Laptop (Linux)
Date: 17.10.2024

## Resource justification

My host has 4 threads, 8 GB of RAM and 340 GB free on the VM volume. 
Idle, the host already uses about 2.6 GB of RAM.
I gave the guest 2 vCPU of my 4 threads because giving more would slow down the host and giving less may have slowed down the ubuntu set up.
I gave it 2 GB of my 8 GB RAM because host already uses 2.6, making total 4.6. And I keep 2.4 GB for the Windows guest in Lab 2.
I gave it a 20 GB dynamically allocated disk of my 340 GB free because my fedora is fresh and I don't know what application I might need in future. So I gave the vm reasonable amount of 20 GB of my disk.


## Breaking the VM

I broke it by using option A. I used this command to break it: sudo rm /etc/hostname

## What did not work the first time

Tried to install vmware workstation pro on an Arch. But it did not work. Tried to use other repository to download it and it did not work either. Then tried to install Virtual Box on Arch. It did work. However my Arch was not set up properly, so folder navigation was not possible. Tried to use terminal and send ISO image to Virtual Box. It did not work. Tried to improve my Arch rice. Figured out that it would take around few days. Then I decided to switch to Fedora and installed workstation pro there. It worked.

## Evidence

- [evidence/vm-setting.png](evidence/vm-setting.png) — virtual machine resources
- [evidence/guest-release.txt](evidence/guest-release.txt) — ubuntu version
- [evidence/broken.png](evidence/broken.png) — guest is broken
- [evidence/snapshot-list.png](evidence/snapshot-list.png) — reverted to snapshot




