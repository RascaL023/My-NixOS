#!/usr/bin/env bash

# Folder tema
THEME_DIR="$HOME/.dotfiles/themes"

# Ambil daftar tema
CHOICE=$(ls "$THEME_DIR" | wofi --show dmenu --prompt "Pilih Theme:")

# Kalau user pilih sesuatu
if [ -n "$CHOICE" ]; then
    echo "Kamu pilih theme: $CHOICE"
    # misalnya copy css ke tempat config wofi
    # cp "$THEME_DIR/$CHOICE/wofi/style.css" "$HOME/.config/wofi/style.css"

    # kalau ada waybar juga
    # cp "$THEME_DIR/$CHOICE/waybar/style.css" "$HOME/.config/waybar/style.css"

    # reload wofi/waybar (contoh)
    # pkill -SIGUSR2 waybar
fi
