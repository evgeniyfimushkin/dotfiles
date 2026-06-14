export TERM=xterm-256color

# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# SSH via macOS Keychain (skotty)
_skotty_sock="$HOME/.skotty/sock/default.sock"
if [[ -S "$_skotty_sock" ]]; then
    export SSH_AUTH_SOCK="$_skotty_sock"
fi
unset _skotty_sock
