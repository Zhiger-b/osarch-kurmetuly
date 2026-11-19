| #   | Evidence file (command)                                        | What I expected        | What I found                                     | What I concluded                                    |
| --- | -------------------------------------------------------------- | ---------------------- | ------------------------------------------------ | --------------------------------------------------- |
| 1   | 05 (systemctl --failed)                                        | nightly-report failing | two units failed: legacy-sync and nightly-report | two leads; check which one is related to the ticket |
| 2   | 01 (hostnamectl)                                               | machine data           | that is was VM                                   | VM could just shut of (need to find reason)         |
| 3   | 02 (uptime)                                                    | runtime                | possible time when it stopped working            | load was low and it was close to midnight           |
| 4   | 03 (df -h)                                                     | overloaded storage     | load was normal                                  | server did not run out of storage                   |
| 5   | 04 (free -h)                                                   | overloaded memory      | there was free memory                            | server did not run out of memory                    |
| 6   | 06 (systemctl list-timers)                                     | times was set up wrong | first timer is close to uptime time              | should check nightly-                               |
| 7   | 08 (systemctl cat nightly-report.service nightly-report.timer) | some lead              | only script description                          | continue checking nighty-                           |
| 8   | 09 (journalctl -u nightly-report.service --no-pager)           | some errors            | errors!                                          | says no such directory, check directory             |
| 9   | 16 (cat /usr/local/bin/nightly-report.sh)                      | missing file           | logs for memory and storage                      | continue looking for directory                      |
| 10  | 19 (/usr/local/bin/nightly-report.sh)                          | missing file           | logs that file is missing                        | look for missing file                               |

