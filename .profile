# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='fd . --hidden'
export FZF_DEFAULT_OPTS='--bind="ctrl-u:preview-up,ctrl-d:preview-down"
--color=fg:#d0d0d0,bg:#1c1c1c,hl:#af5e5e --color=fg+:#d0d0d0,bg+:#252525,hl+:#af5e5e --color=info:#af5e5e,prompt:#af5e5e,pointer:#af5f5f --color=marker:#d78787,spinner:#5f8787,header:#dfafaf'
export FZF_ALT_C_COMMAND='fd . --type d --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
export OPENCV_LOG_LEVEL=ERROR
export XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
systemctl --user import-environment DISPLAY
xrandr --output eDP --set TearFree on
xrandr --output eDP --brightness 1
setxkbmap -layout us -variant intl
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local:$PATH"
export PATH="$HOME/.vim:$PATH"
export TERMINAL=kitty
export TERM=kitty
# export TERM=xterm-256color

export PYTHONPATH=/usr/lib/python3.9/site-packages/
export JAVA_HOME=/usr/lib/jvm/openjdk-17
export PATH=$JAVA_HOME/bin:$PATH
