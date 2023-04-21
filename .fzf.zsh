# Setup fzf
# ---------
if [[ ! "$PATH" == */home/podesta/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/share/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"
