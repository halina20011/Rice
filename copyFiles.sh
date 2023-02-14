i3=~/.config/i3
polybar=~/.config/polybar
neovim=~/.config/nvim
alacritty=~/.config/alacritty

firefox=~/.mozilla/firefox/3r0m794e.m/chrome/userContent.css

themeScheme=~/.themeScheme.json

configs=("$i3 $polybar $neovim $alacritty $firefox $themeScheme")

# echo ${configs[@]}

for con in $configs; do
    echo "Copying $con to $(pwd):"
    $(cp -rf $con ./)
done
