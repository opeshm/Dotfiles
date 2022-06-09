#!/bin/sh
# switch-kb-layout:
# A simple script in order to switcch between some keyboards layouts.

layout=$(setxkbmap -query | grep layout | awk '{print $2}')
case $layout in
  es)
    setxkbmap us
    ;;
  us)
    setxkbmap es
    ;;
  *)
    setxkbmap us
    ;;
esac
