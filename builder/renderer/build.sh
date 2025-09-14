if [[ $1 == 1 ]]; then
    clear;
fi

root="/home/rascal/.dotfiles/themes"
themeName="default"

if [[ $2 == "run" ]]; then
    ./bin/render "$root" "$themeName"
elif [[ $2 == "comp" ]]; then
    gcc main.c -o bin/render -I /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/include \
        -L /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/lib \
        -lcjson
else
    gcc main.c -o bin/render -I /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/include \
        -L /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/lib \
        -lcjson
    ./bin/render "$root" "$themeName"
fi

echo "Completed"
read -s

if [[ $1 == 1 ]]; then
    clear;
fi
