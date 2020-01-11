#!/usr/bin/env sh

export SHELL="zsh"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Start daemon services
! pgrep transmission > /dev/null && transmission-daemon
! pgrep dropbox > /dev/null && dropbox start

# Start X
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm > /dev/null && exec startx
