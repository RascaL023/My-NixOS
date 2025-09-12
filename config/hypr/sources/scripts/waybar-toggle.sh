if pgrep waybar > /dev/null; then
    # Kalau waybar hidup → kill
    pkill waybar
else
    # Kalau waybar mati → hidupkan lagi di background
    waybar -c ~/.dotfiles/themes/deploy/waybar/live/config.jsonc \
           -s ~/.dotfiles/themes/deploy/waybar/live/style.css & disown
fi
