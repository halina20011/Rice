i3=~/.config/i3
polybar=~/.config/polybar
neovim=~/.config/nvim
alacritty=~/.config/alacritty
x11=/etc/X11/xorg.conf.d
clangd=~/.config/clangd

# firefox=~/.mozilla/firefox/3r0m794e.m/chrome/userContent.css
firefox=~/.mozilla/firefox/oiz172e1.default-release/chrome/userContent.css

themeScheme=~/.themeScheme.json

configs=("$i3 $polybar $neovim $alacritty $firefox $themeScheme $x11 $clangd")

# echo ${configs[@]}

for con in $configs; do
    echo "Copying $con to $(pwd):"
    $(cp -rf $con ./)
done
