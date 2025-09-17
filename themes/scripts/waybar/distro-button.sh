# #!/bin/bash
# 
# # toggle workspace khusus untuk panel
# if swaync -t get_tree | grep -q "panel_workspace"; then
#     # jika workspace panel ada, sembunyikan
#     swaync "[workspace=panel_workspace] move workspace to output current; workspace prev"
# else
#     # buat workspace floating untuk panel
#     swaync "workspace panel_workspace; layout tabbed; floating enable"
#     swaync "exec kitty --class=panel -e htop"  # contoh aplikasi
# fi
# 

#!/bin/bash

# Nama panel di swaync
PANEL_ID="my_panel"

# Cek status panel (visible atau tidak)
STATUS=$(swaync list | grep $PANEL_ID | awk '{print $2}')  # contoh: swaync list

if [[ "$STATUS" == "visible" ]]; then
    # kalau visible → sembunyikan
    swaync hide $PANEL_ID
else
    # kalau tidak visible → tampilkan
    swaync show $PANEL_ID --position bottom --height 50%
fi
