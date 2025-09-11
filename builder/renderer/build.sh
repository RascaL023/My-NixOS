if [[ $1 == 1 ]] then
    clear;
fi

gcc main.c -o bin/render -I /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/include \
    -L /nix/store/h4m2hxgpi3cqrc3sxykj114wdqrs8vsv-cjson-1.7.18/lib \
    -lcjson

if [[ $2 == 1 ]] then
    bin/render
    read -s
fi

if [[ $3 == 1 ]] then
    clear;
fi
