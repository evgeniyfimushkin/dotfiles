# dotfiles

My personal dotfiles for macOS.

## What's included

- **Zsh** — Oh My Zsh with custom config split into `.zshrc.d/`
- **Vim** — vim config in `.vim/`
- **Kitty** — terminal emulator config
- **VSCode / VSCodium** — editor settings and keybindings

## Installation

Uses [GNU Stow](https://www.gnu.org/software/stow/) for symlinking.

```sh
brew install stow
git clone <repo> ~/dotfiles
cd ~/dotfiles
stow .
```

## Branches

- `main` — Linux / NixOS configuration
- `mac` — macOS configuration (this branch)
