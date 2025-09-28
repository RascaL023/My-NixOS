#!/usr/bin/env bash

if [[ $1 == "theme" ]]; then
    DIR="$HOME/.dotfiles/themes/theme"
else
    DIR="$HOME/.dotfiles/themes/base/waybar"
fi

# Ambil semua file gambar
FOLDER=($(ls "$DIR" 2>/dev/null))

# Generate list dengan icon preview
LIST=""
for item in "${FOLDER[@]}"; do
    # basename (tanpa path) untuk ditampilkan
    name=$(basename "$item")
    # tambahkan hint icon supaya muncul thumbnail
    LIST+="$name\n"
done

# Panggil rofi dengan preview
SELECTED=$(echo -e "$LIST" | rofi -dmenu -p "Search:")

# Kalau tidak ada pilihan → keluar
[ -z "$SELECTED" ] && exit

if [[ $1 == "theme" ]]; then
    "$HOME"/.dotfiles/builder/renderer/build.sh run main "$SELECTED"
    echo "$SELECTED"
else
    "$HOME"/.dotfiles/builder/renderer/build.sh run waybar "$SELECTED"
fi