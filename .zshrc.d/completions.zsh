if [[ -d "$HOME/.ya.completion/zsh" ]]; then
    fpath=("$HOME/.ya.completion/zsh" $fpath)
fi

autoload -Uz compinit
compinit -C

setopt complete_aliases

if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
fi

if command -v kubecolor &>/dev/null && command -v kubectl &>/dev/null; then
    compdef kubecolor=kubectl
fi
