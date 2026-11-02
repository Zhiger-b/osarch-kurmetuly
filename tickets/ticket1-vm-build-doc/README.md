# Ticket 1 — VM build document

## 1. What was asked

From: Aigerim T. (Office Manager)
Subject: test machine for new dev

Hi, we have someone starting on Monday and he needs a test computer
set up. Nothing special, just so he can try things without breaking
anything. Can you write down how to do it so I can do the next one
myself? Thanks

## 2. What was actually needed

The request left out what hypervisor is being used. On top of that, it does not specify what type of OS is needed. Maybe the 'someone' is frontend developer, or he/she is on the backend. 

It is never specified if I should build separate pc disconnected from network, or should I create guest VM(s) for the new dev? I would have asked what she meant by 'test computer'. Besides, 'breaking anything' means what? Most likely it is some custom/bespoke system that office uses and new dev needs to learn to work with it.

Right now I don't know if the office system needs to be connected with network, nor what type of machine is needed. So I am gonna create two VMs on linux and windows using Vmware Workstation Pro. If it is somehow server orientated, new guy would have ubuntu, and if it is some blue collar spreadsheet, then he has win11.

## 3. What I did

I created step by step guide how to make new virtual machines by using ISO images of ubuntu and windows.

## 4. Evidence

[evidence/01-new-vm-wizard.png](evidence/01-new-vm-wizard.png) - the creation of new VM
[evidence/02-disk-settings.png](evidence/02-disk-settings.png) - setting up the disk storage of VM
[evidence/03-network-adapter.png](evidence/03-network-adapter.png]) - network adapter setting
[evidence/04-guest-uname.txt](evidence/04-guest-uname.txt) - linux is running 
[evidence/05-ping-between-guests.txt](evidence/05-ping-between-guests.txt) - two VMs can "talk"
[evidence/06-snapshot-list.png](evidence/06-snapshot-list.png) - can revert if something breaks
[evidence/Linux-ubuntu-setup](evidence/Linux-ubuntu-setup]) - ubuntu step by step photos
[evidence/Windows-11-setup](evidence/Windows-11-setup) - windows step by step photos

## 5. What I would do differently

I would set network adapter to NAT while creating VMs. It will decrease unnecessary reconfiguration. 

I would have just created VMs myself and send copy to the requestor. This way she can just make copies and have ready-made VMs
