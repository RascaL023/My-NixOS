if [[ $1 == 1 ]]; then
    clear
fi

rootOutputPath="/home/rascal/.dotfiles/themes/theme"
read -p "Masukkan nama tema: " themeName
read -p "Start(y/n)? " inp

if [[ $inp == 'y' ]]; then
    mkdir -p "$rootOutputPath/$themeName"
    echo "Status:"
    javac -d bin -cp "lib/*" $(find src -name "*.java")
    java -cp bin:lib/* jsoncgen.Main "$rootOutputPath" "$themeName"
fi

echo "Proses selesai..."
read -s

if [[ $2 == 1 ]]; then
    clear
fi
