#!/usr/bin/env sh

~/.screenlayout/display.sh

xautolock -time 10 -locker slock &
xss-lock -- slock &

# test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
# xset fp rehash
# xset -b # disable bell

setxkbmap -device 16 "us,ru" ",winkeys" "grp:alt_shift_toggle"
# setxkbmap -device 20 "us,ru" ",winkeys" "grp:alt_shift_toggle"

xset s off
xset m 0 1

# Load Xresources
[[ -f /home/$USER/.Xresources ]] && xrdb -load /home/$USER/.Xresources &

# set background, dwmbar and notifier
setbg &
dwmbar &
dunst &
sxhkd -c /home/$USER/.config/sxhkd/sxhkdrc &

while :; do
    ssh-agent dwm || break
done

