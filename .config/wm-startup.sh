#!/bin/bash
echo "Init wm-startup.sh..." >> /tmp/wm-startup.log

# Caps lock 
setxkbmap -option caps:swapescape

# Check num monitors
echo "Checkin num monitors..." >> /tmp/wm-startup.log
MONITOR_COUNT=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | wc -l)

# Init Monitors
if [[ "${MONITOR_COUNT}" == "2" ]]; then
    if [ -f ~/.screenlayout/Dual-laptop-right.sh ]; then
        . ~/.screenlayout/Dual-laptop-right.sh
    fi
fi

# Polybar
case "${HOSTNAME}" in
    "nzxtarch")
        . ~/.config/polybar/docky-nzxtarch/launch.sh
        ;;
    "asusarch")
        . ~/.config/polybar/docky-asus/launch.sh
        ;;
    "archalpha")
        echo "launching archalpha" >> /tmp/wm-startup.log
        . ~/.config/polybar/docky-alpha15/launch.sh
        if [[ "${MONITOR_COUNT}" == "2" ]]; then
            . ~/.config/polybar/docky-alpha15-extended/launch.sh
        fi
        ;;
esac


nm-applet &

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
