#!/bin/bash
HOME=/home/eugene
DOTFILES=$HOME/dotfiles
CURRENT_DIR=$(pwd)
DATE=$(date +"%Y-%m-%d")

git config --global --add safe.directory $DOTFILES

cd $DOTFILES
git add .
git commit -m "Auto-commit: $DATE"
git push

stow .
stow -t /etc/systemd/system $DOTFILES/systemd

cd $CURRENT_DIR
