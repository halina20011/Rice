# Rice
Custom rice with custom scripts and configs for my machine

## Tools to install
yay -S zsh
yay -S wget p7zip unzip ranger xclip htop imagemagick pavucontrol

lsusb: yay -S usbutils

## For:
i3
polybar
neovim
alacritty
dmenu
firefox

## i3
```shell
yay -S i3-wm i3lock polybar
sudo apt install i3-wm i3lock polybar
```

## X11
```
# save config
xmodmap -pke > ~/.Xmodmap

# print mods
xmodmap -pm

# restart
xmodmap ~/.Xmodmap
```


## polybar dependencies
yay -S alsa-utils

## Firefox 
create "chrome" and "chrome/img" folders in your firefox profile folder
```shell
mkdir -p ~/.mozilla/firefox/[name]/chrome/img
```

in firefox -> url -> "about:config"
change "toolkit.legacyUserProfileCustomizations.stylesheets" to true

## fonts
```shell
yay -S nerd-fonts-git

mkdir RobotoMono
cd RobotoMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip
7x x RobotoMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/NerdFontsSymbolsOnly.zip
wget https://github.com/google/material-design-icons/raw/master/font/MaterialIcons-Regular.ttf
```
move all to "/usr/share/fonts/" and run 
sudo mv -t /usr/share/fonts/ MaterialIcons-Regular.ttf RobotoMono.zip NerdFontsSymbolsOnly.zip
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
freecad-weekly-appimage/freecad-appimage 

### KiCad
kicad
kicad-library-3d-git
kicad-library-digikey-git
kicad-library-espressif-git
kicad-library-git


### Docker
docker
docker-buildx
docker-compose

sysbox-ce-bin
/etc/docker/daemon.json
```{
  "runtimes": {
    "sysbox-runc": {
      "path": "/usr/bin/sysbox-runc",
      "runtimeArgs": []
    }
  }
}
```
