CONFIG_DIR="$HOME/.dotfiles/config/niri/sources";
OUTPUT="$HOME/.dotfiles/config/niri/config.kdl";

cat "$CONFIG_DIR/config.kdl" \
		"$CONFIG_DIR/binds.kdl" \
> "$OUTPUT";
