export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
setxkbmap -layout us -variant intl
systemctl --user import-environment DISPLAY
xrandr --output eDP --set TearFree on
xrandr --output eDP --brightness 1
exec i3
