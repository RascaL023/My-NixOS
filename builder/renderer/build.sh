if [[ $3 == 1 ]]; then
    clear;
fi

root="/home/rascal/.dotfiles/themes"
themeName="default"
waybarLayout="mechabox"

if [[ $1 == "run" ]]; then
    if [[ $2 == "main" ]]; then
        ./bin/render "$root" "$themeName"
    elif [[ $2 == "waybar" ]]; then
        ./bin/waybar "$waybarLayout"
    else
        echo "Invalid run"
    fi
elif [[ $1 == "compile" ]]; then
    if [[ $2 == "main" ]]; then
        gcc main.c -o bin/render -I /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/include \
            -L /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/lib \
            -lcjson
    elif [[ $2 == "waybar" ]]; then
        gcc waybar.c -o bin/waybar -I /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/include \
            -L /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/lib \
            -lcjson
    else
        echo "Invalid compile"
    fi
else
    echo "Invalid"
fi