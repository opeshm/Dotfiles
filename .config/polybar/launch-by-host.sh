#!/bin/bash

case "${HOSTNAME}" in
    "asusarch")
        ~/.config/polybar/docky-asus/launch.sh
        ;;
    "alpha15")
        ~/.config/polybar/docky-alpha15/launch.sh
        ;;
esac
