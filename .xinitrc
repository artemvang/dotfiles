#!/usr/bin/env sh

~/.screenlayout/display.sh

xautolock -time 10 -locker slock &
xss-lock -- slock &

setxkbmap -device 20 "us,ru,ua" ",winkeys" "grp:alt_shift_toggle"

xset s off
xset m 0 1

# Load Xresources
[[ -f /home/$USER/.Xresources ]] && xrdb -load /home/$USER/.Xresources &

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# set background, dwmbar and notifier
setbg &
dwmbar &
dunst &
sxhkd -c /home/$USER/.config/sxhkd/sxhkdrc &

while :; do
    ssh-agent dwm || break
done

