# Lab 3 — Teardown, and the same machine from the command line

Pair:                     Driver first half:
Machine:
Date:

## The machine

Exact model: Acer Extensa 215-51K

I found it by using this command:
	
```
<sudo dmidecode -t system>
```

I was not able to find service manual no matter how hard I looked. I did not find any similar models too. That is why I decided to just open my laptop and took some photos. All photos will be located in evidence folder
## Components

**1. What:** System board
**Connects to:** Everything
**Limits:** CPU is soldered, not upgradable

**2. What:** Memory
**Connects to:** SO-DIMM slot (1 stick), soldered onto the board
**Limits:** 1 slot, 4GB is soldered, DDR4, 32GB on paper, in reality 20GB (4GB soldered + 16GB stick)

**3. What:** SSD
**Connects to:** M.2 slot
**Limits:** Size code: 2280, NVMe, 1 M.2 slot

**4. What:** Wi-Fi
**Connects to:** Small M.2 slot
**Limits:** Replaceable

**5. What:** Battery 
**Connects to:** The motherboard
**Limits:** Replaceable (I have done it few times)

**6. What:** Keyboard
**Connects to:** The motherboard
**Limits:** Connected through FPC / Flap Flexible cable

**7. What:** Cooling
**Connects to:** Power from motherboard, heat pipe over CPU
**Limits:** One fan

**8. What:** Display
**Connects to:** The motherboard through eDP cable
**Limits:** diagonal 15.6''

**9. What:** RTC battery
**Connects to:** The motherboard
**Limits:** Laptop has RTC battery

## Upgrade verdict
| Question                     | Manual / Physical inspection                      | Windows                                              | Linux (host, not VM)                                                            |
| ---------------------------- | ------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------- |
| How many memory slots?       | 1 SO-DIMM slot + 4 GB soldered RAM                | Win32_PhysicalMemoryArray → 64                       | dmidecode -t 16 → Number Of Devices = 2                                         |
| Which are empty?             | 0 empty slots; 1 occupied SO-DIMM slot            | Count Win32_PhysicalMemory entries → 1 memory device | dmidecode -t 17 → 2 memory devices detected; both 4 GiB                         |
| Soldered or socketed?        | 4 GB soldered + 4 GB removable SO-DIMM            | FormFactor → FormFactor = 8 (DIMM)                   | dmidecode -t 17 → SODIMM for both entries (doesn't reflect physical inspection) |
| Maximum memory?              | 32GB                                              | MaxCapacity → 68157440KB                             | dmidecode -t 16 → Maximum Capacity = 32 GiB                                     |
| Storage interface and slots? | Physical inspection → 1 M.2 connector             | Get-PhysicalDisk → BusType = NVMe                    | lsblk → NVMe (nvme0n1), 476.9 GB                                                |
| CPU  On replaceable?         | Physical inspection → CPU soldered to motherboard | Win32_Processor → Intel Core i5-6300U                | dmidecode -t processor → Upgrade = Socket BGA1356 (soldered)                    |

My linux host identifies 2 memory devices, while in reality one of them is soldered. On top of that, windows vm believes that max memory is 65GB, while in truth it is 32GB.

## Two OS table

| Fact               | Windows (VM)                                                                                   | Linux                                                         |
| ------------------ | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| CPU model          | `Win32_Processor` Name = Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz                              | `lscpu` Model name = Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz |
| Physical cores     | `Win32_Processor` NumberOfCores = 1 per CPU × 2 CPUs = 2                                       | `lscpu` Core(s) per socket = 2 × Socket(s) = 1 → 2 cores      |
| Logical CPUs       | `Win32_ComputerSystem` NumberOfLogicalProcessors = 2                                           | `lscpu` CPU(s) = 4                                            |
| Max clock          | `Win32_Processor` MaxClockSpeed = 2496 MHz                                                     | `lscpu` CPU max MHz = 3000 MHz                                |
| Cache              | `Win32_Processor` L2CacheSize = 256 KB, L3CacheSize = 3072 KB                                  | `lscpu` L1d = 64 KiB, L1i = 64 KiB, L2 = 512 KiB, L3 = 3 MiB  |
| Total memory       | `Win32_ComputerSystem` TotalPhysicalMemory = [4293677056](tel:4293677056) bytes (4 GB)         | `free -h` total = 7.6 GiB                                     |
| Memory type, speed | `Win32_PhysicalMemory` SMBIOSMemoryType = 3 (DDR3), ConfiguredClockSpeed = 4800 MHz            | `dmidecode` Type and Speed = DDR4 4800 MHz                    |
| Disk is SSD        | `Get-PhysicalDisk` MediaType = SSD                                                             | `lsblk` ROTA = 0                                              |
| Disk interface     | `Get-PhysicalDisk` BusType = NVMe                                                              | `lsblk` TRAN = NVMe                                           |
| Motherboard        | `Win32_BaseBoard` Manufacturer = Intel Corporation, Product = 440BX Desktop Reference Platform | `dmidecode` Manufacturer = SKL, Product Name = Taurus_KL      |


## Evidence

- [evidence/manual-figures](evidence/manual-figures) — photos of opened laptop
- [evidence/linux-specs.txt](evidence/linux-specs.txt) — host OS output
- [evidence/window-specs.txt](evidence/window-specs.txt) — host OS output
