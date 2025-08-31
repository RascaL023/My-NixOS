if pgrep waybar > /dev/null; then
    # Kalau waybar hidup → kill
    pkill waybar
else
    # Kalau waybar mati → hidupkan lagi di background
    waybar & disown
fi
