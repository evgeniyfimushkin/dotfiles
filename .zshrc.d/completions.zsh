# ya tool completions
if [[ -d "$HOME/.ya.completion/zsh" ]]; then
    fpath=("$HOME/.ya.completion/zsh" $fpath)
fi

autoload -Uz compinit
compinit -C

setopt complete_aliases

# Only load kubectl completion if kubectl is installed
if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
fi

# Only set compdef for kubecolor if both kubecolor and kubectl exist
if command -v kubecolor &>/dev/null && command -v kubectl &>/dev/null; then
    compdef kubecolor=kubectl
fi
