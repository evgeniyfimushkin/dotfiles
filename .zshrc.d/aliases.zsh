# Ctrl+L — clear visible screen but preserve kitty scrollback buffer
# function _clear_screen() { printf '\n%.0s' {1..$(tput lines)}; zle redisplay; }
# zle -N _clear_screen
# bindkey '^L' _clear_screen


# Only set aliases if the target commands exist
if command -v kubecolor &>/dev/null; then
    alias kubectl="kubecolor"
fi

if command -v codium &>/dev/null; then
    alias code="codium"
fi
