# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="maran"
ZSH_DISABLE_COMPFIX=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

ZSHRC_D="${ZDOTDIR:-$HOME}/.zshrc.d"
if [[ -d "$ZSHRC_D" ]]; then
  for file in "$ZSHRC_D"/*.zsh; do
    [[ -r "$file" ]] && source "$file"
  done
fi

