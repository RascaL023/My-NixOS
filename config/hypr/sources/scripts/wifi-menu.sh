#!/usr/bin/env bash

# ambil daftar SSID + signal
networks=$(nmcli -t -f SSID,SIGNAL dev wifi list | \
  awk -F: '{if ($1 != "") print $1 " (" $2"%)"}' | sort -u)

# pilih SSID via wofi
chosen=$(echo -e "$networks" | wofi --dmenu --prompt "WiFi" --height 300 --width 400)

# kalau cancel
[ -z "$chosen" ] && exit 0

# ambil SSID (buang signal strength)
ssid=$(echo "$chosen" | sed 's/ (.*//')

# coba connect tanpa password (kalau sudah tersimpan sebelumnya akan langsung connect)
nmcli dev wifi connect "$ssid" && exit 0

# kalau gagal, minta password via wofi
password=$(wofi --dmenu --password --prompt "Password for $ssid")

# kalau cancel password
[ -z "$password" ] && exit 1

# connect pakai password
nmcli dev wifi connect "$ssid" password "$password"
