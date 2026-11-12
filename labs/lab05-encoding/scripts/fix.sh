#!/usr/bin/env bash
# Lab 5 — convert staff-broken.csv to UTF-8
set -euo pipefail
SRC_ENC="RK1048"
IN=evidence/staff-broken.csv
OUT=evidence/staff-fixed.csv

# 1. decode from SRC_ENC, encode as UTF-8
# 2. line endings: keep or change, per section 7  (sed 's/\r$//' gives LF)
# 3. BOM: add or not, per section 8               (printf '\xEF\xBB\xBF' writes one)
{
  printf '\xEF\xBB\xBF'
  iconv -f "$SRC_ENC" -t UTF-8 "$IN" # | sed 's/\r$//'
} > "$OUT"

file -e csv "$OUT"
xxd -l 16 "$OUT"
