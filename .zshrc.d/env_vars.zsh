export TERM=xterm-256color

# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# SSH via macOS Keychain
export SSH_AUTH_SOCK=${HOME}/.ssh/agent.sock
