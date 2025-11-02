title=$(playerctl metadata xesam:title 2>/dev/null)
artist=$(playerctl metadata xesam:artist 2>/dev/null)
status=$(playerctl status 2>/dev/null)

if [[ -z "$title" ]]; then
    echo "No Music"
else
    echo "$artist - $title"
fi
