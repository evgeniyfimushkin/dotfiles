autoload -Uz compinit
compinit -C

# Only load kubectl completion if kubectl is installed
if command -v kubectl &>/dev/null; then
    source ~/.zshrc.d/kubectl_completion.zsh
fi

# Only set compdef for kubecolor if both kubecolor and kubectl exist
if command -v kubecolor &>/dev/null && command -v kubectl &>/dev/null; then
    compdef kubecolor=kubectl
fi
