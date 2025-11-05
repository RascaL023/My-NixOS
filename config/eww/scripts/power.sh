if [[ $1 == 'shutdown' ]]; then
    shutdown now
elif [[ $1 == 'lock' ]]; then
    hyprlock
elif [[ $1 == 'logout' ]]; then
    loginctl terminate-user $USER
elif [[ $1 == 'reboot' ]]; then
    reboot
elif [[ $1 == 'sleep' ]]; then
    systemctl suspend
# elif [[ $1 == 'reset' ]]; then
#     pkill eww && eww daemon
fi