#!/bin/bash

sleep 0.2
# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst
# i3lock -u -n -k -F -i $HOME/images/Wallpapers/41.png \
i3lock -u -n -e -F -i $HOME/images/Wallpapers/41.png \
    # --inside-color=373445ff --ring-color=ffffffff --line-uses-inside \
    # --keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
    # --insidever-color=373445ff --verif-color=373445ff --insidewrong-color=d23c3dff \
    # --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+40:y+735" \
    # --radius=15 --verif-text="" --wrong-text="" --noinput-text="" \
    # --time-pos="x+700:y+270" --time-font=Fira Code Nerd Font \
    # --date-font=Fira Code Nerd Font --time-size=48 --time-str="%H:%M"
pkill -u $USER -USR2 dunst

# Revert compton's config changes.
sleep 0.2
