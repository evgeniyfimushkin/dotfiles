#!/bin/bash
HOME=/home/eugene
OBSIDIAN=$HOME/git/obsidian
CURRENT_DIR=$(pwd)
DATE=$(date +"%Y-%m-%d")

git config --global --add safe.directory /home/eugene/git/pc-config

cd $OBSIDIAN
git add .
git commit -m "Auto-commit: $DATE"
git push

cd $CURRENT_DIR
