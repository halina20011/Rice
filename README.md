# Rice
Custom rice with custom scripts and configs for my machine

## Tools to install
yay -S wget p7zip unzip ranger xclip htop imagemagick

lsusb: yay -S usbutils

## For:
i3
polybar
neovim
alacritty
dmenu
firefox

## i3
yay -S i3-wm i3lock polybar
sudo apt install i3-wm i3lock polybar

## polybar dependencies
yay -S alsa-utils

## Firefox 
create "chrome" and "chrome/img" folders in your firefox profile folder
mkdir -p ~/.mozilla/firefox/[name]/chrome/img

in firefox -> url -> "about:config"
change "toolkit.legacyUserProfileCustomizations.stylesheets" to true

## fonts
yay -S nerd-fonts-git

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/NerdFontsSymbolsOnly.zip
wget https://github.com/google/material-design-icons/raw/master/font/MaterialIcons-Regular.ttf

move all to "/usr/share/fonts/" and run 
fc-cache -f

## gdb
gdb-dashboard https://github.com/cyrus-and/gdb-dashboard/blob/master/.gdbinit

```
define hook-quit
    set confirm off
end

define hook-exit
    set confirm off
end

[gdb-dashboard]
```

## Other software
libreoffice-still
cura-bin
