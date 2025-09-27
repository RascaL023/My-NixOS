#!/usr/bin/env bash

# Folder berisi wallpaper
DIR="$HOME/.dotfiles/themes/theme/"

# Ambil semua file gambar
FILES=($(ls "$DIR" 2>/dev/null))

# Generate list dengan icon preview
LIST=""
for img in "${FILES[@]}"; do
    # basename (tanpa path) untuk ditampilkan
    name=$(basename "$img")
    # tambahkan hint icon supaya muncul thumbnail
    LIST+="$name\n"
done

# Panggil rofi dengan preview
SELECTED=$(echo -e "$LIST" | rofi -dmenu -p "Themes:")
# SELECTED=$(echo -e "$LIST" | wofi --dmenu --allow-images --prompt "Wallpaper:")


# Kalau tidak ada pilihan → keluar
[ -z "$SELECTED" ] && exit

# Ambil path full sesuai pilihan
CHOSEN="$DIR/$SELECTED"

# Set wallpaper dengan transisi
# swww query || swww init
# swww img "$CHOSEN" --transition-type center --transition-fps 60 --transition-step 200