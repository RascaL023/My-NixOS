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
    ln -sfn "/home/rascal/.dotfiles/themes/theme/$SELECTED" "/home/rascal/.dotfiles/themes/current"
    .config/hypr/sources/scripts/nextwall.sh first
    "$HOME"/.dotfiles/builder/renderer/build.sh run waybar mechabox
    "$HOME"/.config/hypr/sources/scripts/waybar-toggle.sh
    "$HOME"/.config/hypr/sources/scripts/waybar-toggle.sh
    if [[ $SELECTED == "Redre" ]]; then
        dconf write /org/gnome/desktop/interface/gtk-theme "'Win12X-Fantasy-Purple-Dark'"
    else 
        dconf write /org/gnome/desktop/interface/gtk-theme "'Sweet-Dark-v40'"
    fi
else
    ln -sfn "/home/rascal/.dotfiles/themes/base/waybar/$SELECTED/config.template" "/home/rascal/.dotfiles/themes/deploy/waybar/live/config.jsonc"
    ln -sfn "/home/rascal/.dotfiles/themes/base/waybar/$SELECTED/style.css.template" "/home/rascal/.dotfiles/themes/deploy/waybar/live/style.css"
    "$HOME"/.config/hypr/sources/scripts/waybar-toggle.sh
    "$HOME"/.config/hypr/sources/scripts/waybar-toggle.sh
fi