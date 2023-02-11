i3=~/.config/i3
polybar=~/.config/polybar
neovim=~/.config/nvim
alacritty=~/.config/alacritty

configs=("$i3 $polybar $neovim $alacritty")

# echo ${configs[@]}

for con in $configs; do
    echo "Copying $con to $(pwd):"
    $(cp -rf $con ./)
done
