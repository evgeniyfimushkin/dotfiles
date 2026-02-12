autoload -Uz compinit
compinit -C
source ~/.zshrc.d/kubectl_completion.zsh
compdef kubecolor=kubectl
