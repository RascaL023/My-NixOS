if pgrep wofi > /dev/null; then
    pkill wofi
else
		wofi
fi
