# Lab 2 — A Windows guest, and a network between them

Pair: Zhiger               Driver first half: Zhiger
Machine: Laptop
Date: 23.10.26

## Network diagram

```
                 Internet
                    |
     [ Host: my laptop ]   real network: Wi-Fi, 192.168.0.113
                    |
      ( NAT router of the hypervisor )   gateway 192.168.27.2
                    |
   ===== virtual switch: VMnet8 (NAT) ======
          |                         |
  [ lab01-ubuntu ]          [ lab02-win11 ]
  ens33                     Ethernet0
  192.168.27.129             192.168.27.130
```

## Network mode

I used NAT mode for both guests.
Requirement: the guests must reach each other and the internet.
NAT meets both because because both VMs can access the internet through the host's network.
I did not use bridged because I tried NAT and it sufficed.
I did not use host-only because it does not provide internet connection.

## The firewall

Ping did not fail and VM ubuntu was able to ping VM win11. I have checked firewall profiles, but domain, private, public had state "ON". On top of that all profile setting's firewall policies were "BlockInbound,AllowOutbound". After that I checked ICMP firewall rules and found the ones named ICMPv4-In. When I checked them I found out that one of them is enabled and allowed incomming ping from from public profiles.

## Overcommitment experiment

The host has 7.6Gi of RAM in total. The sum promised to the guests was 10G. Before the overcommitment available memory was 6.2Gi, and after it was 213Mi. Host slowed down, mouse was lagging, and every action/click took few second to affect. After opening 20 tabs VMs became unresponsive and every mouse-click resulted in warning. My GNOME on fedora tried to stop the vmware, but wasn't able to. So I killed VMs through terminal.

## What did not work the first time

Downloading VMware Tools and creating shared folder tool a while. I have reinstalled VMware Tools couple of time because it did not want to open shared folder through Network tab.

## Evidence

- [evidence/ipconfig-windows.txt](evidence/ipconfig-windows.txt) — ip of win11 VM
- [evidence/ip-addr-linux.txt](evidence/ip-addr-linux.txt) — ip of ubuntu VM
- [evidence/ping-both-ways.txt](evidence/ping-both-ways.txt) — pinging VMs
- [evidence/host-memory-before.png](evidence/host-memory-before.png) — host memory before overcommit
- [evidence/host-memory-after.png](evidence/host-memory-after.png) — host memory after overcommit
- [evidence/firewall-ICMPv4-In-rule.png](evidence/firewall-ICMPv4-In-rule.png) — evidence of already existing firewall rule
