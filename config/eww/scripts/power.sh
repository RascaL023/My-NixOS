if [[ $1 == 'shutdown' ]]; then
    shutdown now
elif [[ $1 == 'lock' ]]; then
    hyprlock
elif [[ $1 == 'logout' ]]; then
    loginctl terminate-user $USER
fi