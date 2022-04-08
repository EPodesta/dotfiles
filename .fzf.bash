# Setup fzf
# ---------
if [[ ! "$PATH" == */home/podesta/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/podesta/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/podesta/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/podesta/.fzf/shell/key-bindings.bash"
