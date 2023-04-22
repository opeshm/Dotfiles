#!/bin/bash

# Check num monitors
MONITOR_COUNT=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | wc -l)

# Init Monitors
if [[ "${MONITOR_COUNT}" == "2" ]]; then
    if [ -f ~/.screenlayout/Dual-laptop-right.sh ]; then
        . ~/.screenlayout/Dual-laptop-right.sh
    fi
fi

# Polybar
case "${HOSTNAME}" in
    "asusarch")
        . ~/.config/polybar/docky-asus/launch.sh
        ;;
    "archalpha")
        ~/.config/polybar/docky-alpha15/launch.sh
        if [[ "${MONITOR_COUNT}" == "2" ]]; then
            . ~/.config/polybar/docky-alpha15-extended/launch.sh
        fi
        ;;
esac
