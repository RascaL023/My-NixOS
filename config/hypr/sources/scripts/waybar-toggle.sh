if pgrep waybar > /dev/null; then
    # Kalau waybar hidup → kill
    pkill waybar
else
    # Kalau waybar mati → hidupkan lagi di background
    waybar -c ~/.dotfiles/config/waybar/config.jsonc \
           -s ~/.dotfiles/themes/current/waybar/style.css & disown
fi
