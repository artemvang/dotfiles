#!/usr/bin/env sh

xautolock -time 10 -locker slock &
xss-lock -- slock &

test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell

setxkbmap "us,ru" ",winkeys" "grp:alt_shift_toggle"

xset s off
xset m 0 1

# X related jobs
setbg &
dwmbar &
dunst &

while :; do
	ssh-agent dwm || break
done

