# History settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"

setopt HIST_IGNORE_DUPS      # Don't record duplicate consecutive commands
setopt HIST_IGNORE_SPACE     # Don't record commands starting with a space
setopt HIST_REDUCE_BLANKS    # Remove extra blanks from commands
setopt SHARE_HISTORY         # Share history between all sessions
setopt INC_APPEND_HISTORY    # Write to history file immediately
