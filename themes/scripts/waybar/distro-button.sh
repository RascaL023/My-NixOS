if [[ $1 == 3 ]]; then
	ln -sfn /home/rascal/.dotfiles/themes/scripts/kitty/config/boost.conf /home/rascal/.dotfiles/config/kitty/sources/trail.conf
elif [[ $1 == 1 ]]; then
	ln -sfn /home/rascal/.dotfiles/themes/scripts/kitty/config/light.conf /home/rascal/.dotfiles/config/kitty/sources/trail.conf
fi
