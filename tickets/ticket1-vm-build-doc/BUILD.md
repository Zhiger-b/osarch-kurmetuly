
## Step 1. Ubuntu Virtual Machine (VM) creation

> Open VMware Workstation Pro and press "create a new virtual machine"
![](evidence/Linux-ubuntu-setup/1.png)


> After choose 'typical' and press 'Next'
![](evidence/Linux-ubuntu-setup/2.png)


> Choose "Use ISO image" and press browse button
> Locate and select ISO image (you may take it from me)
![](evidence/Linux-ubuntu-setup/3.png)


> Make sure 'Linux' is checked and press 'Next'
![](evidence/Linux-ubuntu-setup/4.png)


> Give it a name and set location
![](evidence/Linux-ubuntu-setup/5.png)


> Allocate 20 GB of storage and 'store virtual disk as a file'
![](evidence/Linux-ubuntu-setup/6.png)

Why 20 GB: it is enough for testing and storing material on the OS. 


> Press 'Customize hardware'
> Set memory to 2GB, Processors to 1, and Network adapter to **NAT**

![](evidence/Linux-ubuntu-setup/8.png)
![](evidence/Linux-ubuntu-setup/9.png)
![](evidence/Linux-ubuntu-setup/10.png)

Why 2GB of memory and 1 processor: memory and processing power is needed for the host to run guests, and windows guest would need more resources. So we are cutting corners where we can.
Why Network adapter NAT: so guest(s) would use MAC address of the host

> If this page appears, check "Don't show this page again" and 'Close'
![](evidence/Linux-ubuntu-setup/11.png)


## Step 2. Ubuntu setup

> This is the current screen
> Wait till it fully loads
![](evidence/Linux-ubuntu-setup/12.png)


> Press once on opened window to go into it
> Now all the actions will be done by using arrow keys and Enter button
> Press enter once
![](evidence/Linux-ubuntu-setup/13.png)


> Now wait till it loads
![](evidence/Linux-ubuntu-setup/14.png)



> Hover over 'English' and press enter
![](evidence/Linux-ubuntu-setup/15.png)



> Your screen may be like this
![](evidence/Linux-ubuntu-setup/16.png)
> Using your mouse or touchpad go on top and press 'expand' button (two arrows located diagonally)
> When returning to linux don't forget to press on the window to go into it
> Press Enter while hovering 'Done'
![](evidence/Linux-ubuntu-setup/17.png)


> Check 'Ubuntu server' if not checked ('X' should be in the brackets)
> Hover over 'Done' and press Enter
![](evidence/Linux-ubuntu-setup/18.png)


> Here just press 'Done'
![](evidence/Linux-ubuntu-setup/19.png)

> Skip it too and press 'Done'
![](evidence/Linux-ubuntu-setup/20.png)


> Wait until tests are done
> ![](evidence/Linux-ubuntu-setup/21.png)
> and press 'Done'
![](evidence/Linux-ubuntu-setup/22.png)


> Check 'Use an entire disk' if not checked and press 'Done'
![](evidence/Linux-ubuntu-setup/23.png)


> Press 'Done' and 'Continue'
![](evidence/Linux-ubuntu-setup/24.png)
![](evidence/Linux-ubuntu-setup/25.png)


> Fill the blank spaces and remember your username and password
![](evidence/Linux-ubuntu-setup/26.png)


> Check "Skip for now" if not checked and press 'Continue'
![](evidence/Linux-ubuntu-setup/27.png)



> Navigate to 'Done' by using arrow keys and press 'Done'
![](evidence/Linux-ubuntu-setup/28.png)


> Navigate to 'Done' by using arrow keys and press 'Done'
![](evidence/Linux-ubuntu-setup/29.png)


> Now wait until 'Reboot now' button appears
![](evidence/Linux-ubuntu-setup/30.png)

> And press it
![](evidence/Linux-ubuntu-setup/31.png)


> When virtual machine reboots press Enter
![](evidence/Linux-ubuntu-setup/32.png)


> Input login and password
![](evidence/Linux-ubuntu-setup/33.png)
![](evidence/Linux-ubuntu-setup/34.png)

> run 'ip addr' command 
> save the numbers that look like 192.168.X.X (X should be other numbers in the range of 0-255 each)


## Step 3. Windows 11 VM creation

> Creation starts the same way as in Ubuntu 
> Press 'Create a new virtual machine'
> But make sure that you chose different ISO image


> In this window choose "Only the files needed to support virtual TPM"
> And generate password
![](evidence/Windows-11-setup/2.png)


> Allocate 64 GB of storage and 'store virtual disk as a file'
![](evidence/Windows-11-setup/2.png)


> Press "Customize hardware" and set values
> Memory: 4
> Processor: 2
> Network adapter: **NAT**
![](evidence/Windows-11-setup/3.png)
![](evidence/Windows-11-setup/4.png)
![](evidence/Windows-11-setup/5.png)

Why this values: it is important to give minimal, or enough resources to the guest. 4GB of memory, 64GB of storage and 2 processors are bare minimum. Ideally, if it is possible, windows vm should get aroung 1/4 of memory and couple more processors to work faster.


> If something like this happens, then press maximize button 2 times
> Be ready to press any button (except power button) when "PRESS ANY KEY" text appears
![](evidence/Windows-11-setup/6.png)


## Step 4. Windows 11 setup

> if you did not made it in time, then wait until blue menu appears 
> Navigate in it to the 'Reboot the system' button and press Enter
> Now try again to make it in time


> Follow the setup options
![](evidence/Windows-11-setup/7.png)
![](evidence/Windows-11-setup/8.png)
![](evidence/Windows-11-setup/9.png)
![](evidence/Windows-11-setup/10.png)
![](evidence/Windows-11-setup/11.png)
![](evidence/Windows-11-setup/12.png)


> Wait until it fully installs
> It will reboot several times
![](evidence/Windows-11-setup/13.png)
![](evidence/Windows-11-setup/14.png)



> Continue this setup
![](evidence/Windows-11-setup/15.png)


> On this window select "Sing-in options"
> And then 'Domain join instead'
![](evidence/Windows-11-setup/16.png)
![](evidence/Windows-11-setup/17.png)


> Continue
![](evidence/Windows-11-setup/18.png)
![](evidence/Windows-11-setup/19.png)
![](evidence/Windows-11-setup/20.png)


> On this page turn off all the checks
![](evidence/Windows-11-setup/21.png)


> Press 'Update later'
![](evidence/Windows-11-setup/22.png)


> Open cmd and run command 'ipconfig' and write down 192.168.X.X ip address

## Step 5. Ping Between Guests

> Open powershell as an administrator and run this command

'''
<New-NetFirewallRule -DisplayName "In Network - allow ping" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -RemoteAddress LocalSubnet -Action Allow>
'''

![](evidence/Windows-11-setup/23.png)


> Now you can ping between guests by running 'ping -n 4 FIRST_IP' in cmd and 'ping -c 4 SECOND_IP' in ubuntu. Change the 'FIRST_IP' to the ip address taken from ubuntu and 'SECOND_IP' from windows.


## Step 6. Snapshots

> Turn off guests
> Go to Vmware Workstation Pro
![](evidence/Windows-11-setup/24.png)

> Rightclick the vm and find 'snapshot'
> It is press 'take snapshot'
![](evidence/Windows-11-setup/25.png)
> Now developer can get back to this point, it works like checkpoints


> You can manage snapshots in 'snapshot manager'
![](evidence/Windows-11-setup/26.png)