setxkbmap br
systemctl --user import-environment DISPLAY
xinput set-prop 14 278 1
xrandr --output eDP --brightness 0.6
exec i3
