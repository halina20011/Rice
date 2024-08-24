#!/bin/sh

setxbmap gb
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
# exec i3 --shmlog-size=26214400
exec i3
