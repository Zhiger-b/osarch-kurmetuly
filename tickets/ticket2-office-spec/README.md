# Ticket 2 — "We are kitting out the new office"

Prepared for: Daniyar K. (Director). Prices: dns-shop.kz, KZT, taken on 2026-11-15.

## 1. Short answer

No, the four machines should not be identical. Four copies of the designer's machine would cost 4 × 1,093,250 = 4,373,000 KZT, which is over the 3,000,000 budget. Four copies of the accountant's machine would cost 4 × 539,940 = 2,159,760 KZT and would leave the designer without a discrete GPU and without a second monitor, and the developer with half the memory he needs. The loads are different, so the bottleneck is different on each machine, and the money should go where each machine is limited.

The accountant and the sales manager do share the same base (CPU, board, cooler, SSD), because both are office workloads that need little CPU. They still differ: sales has a different memory layout, a webcam and a microphone, and is the machine most likely to run out of memory.

## 2. The four machines

| Role | CPU | Memory | GPU | Monitors | Total, KZT |
|---|---|---|---|---|---|
| Web developer | Core i5-12600K | 32 GB (2 × 16, dual channel) | integrated | 1 × 27" 1440p | 751,050 |
| Accountant | Core i3-12100T | 16 GB (1 × 16, one slot free) | integrated | 1 × 27" 1440p | 539,940 |
| Sales | Core i3-12100T | 16 GB (2 × 8, dual channel) | integrated | 1 × 27" 1440p + webcam, mic | 588,070 |
| Designer | Core i5-13600KF | 16 GB (2 × 8, dual channel) | RTX 5050 8 GB | 27" IPS + 26.5" QD-OLED | 1,093,250 |

Every machine has a 1 TB NVMe SSD, Windows 11 Home (retail), keyboard, mouse and speakers. The three machines without a GPU use a 650 W power supply; the designer's has 850 W. The reasoning for each machine (load, bottleneck, trade-off) is in `builds.md`.

## 3. Budget, prices and dates

- Total for all four: **2,972,310 KZT**. Budget: 3,000,000. Reserve: **27,690 KZT** (0.9% of the budget).
- Every line is in `budget.csv` with its source and the date the price was taken (2026-11-15). The product pages and availability are in `evidence/`.
- Memory and SSD prices in Kazakhstan move within a month, so every price here is valid for the date in the file only. The reserve is thin, so a price rise of about 1% on the total would break the budget. Re-check every price on the day of purchase.
- The Windows 11 Home price (79,840) is a promotional price (list price 88,720). The Cougar GEC 850 power supply is counted at the cash/card price (40,690, list 42,840).
- Core i3-12100T (two needed) and the RTX 5050 were in stock in one store each, and the Xilence power supply could only be ordered for delivery on 19 November. The Core i5-12600K (6 stores) and Core i5-13600KF (12 stores) were in stock. Availability must be confirmed before ordering.
- Memory to order: three Netac 16 GB modules and two ADATA 2 × 8 GB kits.

## 4. The three questions

**1. Which machine will you upgrade first, eighteen months from now, and why?**
The designer's machine. After the CPU upgrade (14 cores) its weak point is memory: 16 GB is the minimum, and file sizes and application requirements grow over time. The upgrade is well defined: replace the 2 × 8 GB kit with 2 × 16 GB. The two monitors, the GPU, the CPU, the case and the power supply stay useful. The reserve is too small to do this now, so it is a later purchase. The sales machine is the next candidate (see question 3). The developer's machine, at 32 GB and 10 cores, is the best placed of the four.

**2. Price the same four as pre-built machines from a vendor. What does the company gain and what does it lose by not building them?**
Quote: the closest pre-built found at DNS is the MSI MPG Trident AS 14NUC5-695RU (Core i5-14400F, 16 GB DDR4, RTX 4060 8 GB, 1 TB NVMe, Windows 11 Home), 658,090 KZT on 2026-11-15. It has no monitor, keyboard or mouse, so the same monitors and peripherals as in our builds were added to keep the scope equal. Details are in `evidence/vendor-quotes/prebuilt-quotes.md`.

| Role | Pre-built, KZT | Self-built, KZT | Self-built is cheaper by, KZT |
|---|---|---|---|
| Web developer | 758,900 | 751,050 | 7,850 |
| Accountant | 758,900 | 539,940 | 218,960 |
| Sales | 770,630 | 588,070 | 182,560 |
| Designer | 942,890 | 1,093,250 | −150,360 (pre-built is cheaper) |
| **Total** | **3,231,320** | **2,972,310** | **259,010** |

Four pre-built machines would cost 231,320 KZT more than the whole budget. The self-built set fits it.

- *Gain from pre-built:* a single warranty and a single support contact per machine (12 months from the seller), no assembly and testing time, a complete working computer with Windows installed, and built-in Wi-Fi 6E and Bluetooth, which our parts list does not include. For the designer it is also cheaper (by 150,360 KZT) and has a discrete GPU of a similar class.
- *Loss with pre-built:* no machine is tuned to a role. We found no pre-built machines made for designers, developers, accountants or sales managers, only general-purpose models. So one model must serve all four: the accountant and the sales manager pay for an RTX 4060 they do not use, and the developer gets 16 GB of DDR4 where our build has 32 GB of DDR5. The memory slots are full, the 500 W power supply and the slim case limit later upgrades, the platform is DDR4, and the vendor's margin is in the price.
- *Loss with self-built:* someone's time to assemble, test and install four machines, and no single warranty. This cost is real and should be counted at the company's hourly rate.
- *Limit of the comparison:* one model stands in for four roles. A cheaper pre-built without a GPU may exist for the accountant and the sales manager, which would narrow the gap on those two lines.

**3. One of these four people will complain about performance within a month. Which one, and about what?**
The sales manager, about video calls stuttering or the browser reloading tabs when the CRM, Excel and a call are open together. The machine has 16 GB, and that workload needs roughly 11–12 GB before Windows and the call software are counted. Both DIMM slots are filled with 8 GB modules, so the fix is replacing the kit with 2 × 16 GB.

## 5. Risks and what would change the answer

- **Prices and stock.** Memory, SSD and CPU prices change within weeks. Re-take the prices on the day of purchase and update the date column.
- **Single-store items.** Core i3-12100T and the RTX 5050 were in stock in one store each.
- **Memory.** Only the developer's machine has more than the 16 GB minimum. The sales and designer machines are the ones most likely to need more, and the reserve of 27,690 KZT is too small to fix that now, so memory upgrades are a later purchase.
- **Board and CPU power.** The H610M board is an entry-level board and, like every H610 board, does not allow CPU overclocking, so the "K" in both processors gives nothing extra. The Core i5-13600KF is rated 181 W and the Core i5-12600K 150 W. Check that the board's power delivery handles sustained load, especially on the designer's machine.
- **OS licence.** Windows 11 Home is the retail version. If the company needs domain join or business management features, Windows 11 Pro is required, at a higher price.
 