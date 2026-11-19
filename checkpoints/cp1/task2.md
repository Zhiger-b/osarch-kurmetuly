## laptop is cooked
And it will become frying pan if office decides to run both guests. 

To start, host OS is win11. Let's assume that while guest are active it will be idle. Even then it will use around 2-3Gi of memory. 

So, my recommendation is to run guests separately, or be ready for a lot of lag, overheating, and maybe a crash.

Allocation: I would allocate 1 thread, 2Gi memory, and 20G of storage to Ubuntu server. It is minimal configuration for it to start and work. For win11 guest I would allocate 2 threads and 4Gi of memory with 64G of storage. Because it is minimal requirements for windows OS. Both of them dynamically allocated to save some space and ease the load. For network adapter I chose NAT mode.

Arithmetic: Host will be left with 2Gi of memory and 1 thread. As I assumed, host may be idle while guests work. So, maybe, this resources would be enough. But it is plain math. In reality guest, if not under max load, would not utilize all resources.

Justification: NAT mode is chosen for both guests. Requirement: the guests must reach each other and the internet. NAT meets both because because both VMs can access the internet through the host's network. I did not use bridged because I tried NAT and it sufficed. I did not use host-only because it does not provide internet connection.

Verification plan: If both guests start and laptop does not become vacuum cleaner in 5 minutes - then it is success. For network test I would try to ping both ways with this commands:

```
ping -n 4 LINUX_IP //for windows guest
```

```
ping -c 4 WINDOWS_IP //for linux guest
```

If second one fails, then it may be because of firewall rules. First I would check the rules and then, if it is the publicity problem, run this command with admin privileges to add new rule to firewass:
```
New-NetFirewallRule -DisplayName "Lab02 - allow ping (ICMPv4 echo)" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -RemoteAddress LocalSubnet -Action Allow
```



