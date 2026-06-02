# eval "$(ssh-agent -s)" &> /dev/null
ssh-add "$HOME/.ssh"/* &>/dev/null
