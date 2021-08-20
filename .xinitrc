#!/usr/bin/env sh

xrandr --auto

xautolock -time 10 -locker slock &
xss-lock -- slock &

test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell

setxkbmap -device 16 "us,ru" ",winkeys" "grp:alt_shift_toggle"
setxkbmap -device 20 "us,ru" ",winkeys" "grp:alt_shift_toggle"

xset s off
xset m 0 1

# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# X related jobs
setbg &
dwmbar &
dunst &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

while :; do
    ssh-agent dwm || break
done

