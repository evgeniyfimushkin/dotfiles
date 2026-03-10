#!/bin/bash
set -e

OBSIDIAN="$HOME/git/obsidian"
DATE=$(date +"%Y-%m-%d")

cd "$OBSIDIAN"

# Check if there are changes to commit
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to commit"
    exit 0
fi

git add .
git commit -m "Auto-commit: $DATE"
git push
