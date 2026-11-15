# Builds — four machines for the new office

All prices are in KZT from dns-shop.kz, taken on 2026-11-15 (see `budget.csv`). Every machine meets the hard requirements: at least 16 GB of memory, a 1 TB SSD (1024 GB M.2 NVMe), a licensed OS (Windows 11 Home, retail box) and a monitor.

The three machines without a graphics card use a 650 W power supply (28,680). Only the designer's machine, which has a discrete GPU, keeps the 850 W unit (40,690). The saving is 12,010 per machine.

### Build 1 — web developer

**Load:** IDE, a browser with documentation and several dev servers, local containers and a database, git and a terminal, frequent project builds.

**Bottleneck:** memory first. An IDE, a browser and a few containers together can reach 12–16 GB, so this machine gets 32 GB (two 16 GB modules, dual channel). With memory solved, project build times depend on the number of cores, so the CPU is a Core i5-12600K with 10 cores (6 performance and 4 efficiency, 16 threads). The NVMe SSD is not the limit.

**Trade-off:** the i5-12600K costs 48,470 more than the Core i3-14100 it replaced, and together with the second 16 GB module it uses almost all of the reserve. The "K" in the name gives nothing extra here, because the H610 board does not allow overclocking, so the choice was made for the core count. The 280 mm liquid cooler is kept and now fully justified: the chip is rated 150 W and Core chips of this class run hot under long all-core builds. The 650 W power supply is enough because there is no graphics card. Both DIMM slots are used by 16 GB modules, so going beyond 32 GB means replacing the modules.

**Total:** 751,050 KZT (budget.csv, rows 2–14)

### Build 2 — accountant

**Load:** large Excel workbooks, accounting software, PDF and e-mail, online banking in the browser. Long sessions, low peaks, mostly one thread at a time.

**Bottleneck:** single-thread CPU speed when recalculating big workbooks and opening large files. Memory is sufficient at 16 GB. Reliability matters more than speed here, because this machine must simply not fail during reporting periods.

**Trade-off:** one 16 GB module, which is one memory channel instead of two, but it leaves a free DIMM slot for later. A low-power Core i3-12100T with a small tower cooler keeps the machine quiet and cool, and the price is lower sustained clock speed than the i3-14100. The cheaper 650 W power supply is enough because there is no graphics card.

**Total:** 539,940 KZT (budget.csv, rows 15–26)

### Build 3 — sales

**Load:** CRM in a browser with 30–40 tabs, Excel, and several hours of video calls a day, often all at once.

**Bottleneck:** memory, not CPU. A browser with that many tabs plus a video call uses roughly 11–12 GB, so 16 GB leaves little headroom. The CPU is mostly idle in this role. The integrated graphics decode the video and use system memory, so dual channel helps here.

**Trade-off:** 16 GB as two 8 GB modules (dual channel) instead of 32 GB, because the budget went to 32 GB on the developer's machine first. This machine got the 2 × 8 GB kit because memory bandwidth and capacity matter more here than on the accountant's machine. Money was also spent on call quality: a 4 MP webcam (6,990) and a desktop microphone (4,740). The price is that memory is on the edge from day one, and both DIMM slots are full, so the fix is replacing the kit with 2 × 16 GB.

**Total:** 588,070 KZT (budget.csv, rows 27–40)

### Build 4 — designer

**Load:** raster and vector editing, large layered files, colour-critical work on screen, exports. Two monitors: a 27" IPS 1440p 200 Hz and a 26.5" QD-OLED 1440p.

**Bottleneck:** memory. With a 14-core Core i5-13600KF (6 performance and 8 efficiency cores) the CPU is no longer the weak point, and the RTX 5050 handles the GPU-accelerated work. What is left is 16 GB of memory, which will be the first limit on large layered files.

**Trade-off:** the money went to what the designer looks at (QD-OLED monitor, 183,990) and to the discrete GPU (217,090, required because the 13600KF has no integrated graphics), and 61,980 more than the Core i3-14100F went into the CPU. The reserve is almost used up, so memory stays at the 16 GB minimum and the fix is a later purchase. The 13600KF is rated 181 W; the 280 mm cooler and the 850 W power supply cover it, but the entry-level H610 board may limit sustained power, which is the risk accepted here.

**Total:** 1,093,250 KZT (budget.csv, rows 41–54)

---

**All four machines: 2,972,310 KZT. Budget 3,000,000. Reserve 27,690.**

Memory to order: three Netac 16 GB modules (two for the developer, one for the accountant) and two ADATA 2 × 8 GB kits (sales and designer).
