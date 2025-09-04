#!/usr/bin/env bash

# Folder berisi wallpaper
DIR="$HOME/Pictures/Wallpaper/"

# File cache untuk menyimpan index terakhir
INDEX_FILE="$HOME/.cache/wall_index"

# Ambil semua gambar ke array (urut alfabet)
mapfile -t FILES < <(ls "$DIR"/*.{jpg,jpeg,png} 2>/dev/null)

TOTAL=${#FILES[@]}

# Kalau belum ada cache, mulai dari 0
if [[ ! -f "$INDEX_FILE" ]]; then
    echo 0 > "$INDEX_FILE"
fi

INDEX=$(cat "$INDEX_FILE")

# Ambil file sekarang
FILE="${FILES[$INDEX]}"

# Tampilkan dengan transisi circle
swww img "$FILE" --transition-type center --transition-fps 60 --transition-step 90

# Naikkan index + balik ke 0 jika habis
NEXT=$(( (INDEX + 1) % TOTAL ))
echo $NEXT > "$INDEX_FILE"
