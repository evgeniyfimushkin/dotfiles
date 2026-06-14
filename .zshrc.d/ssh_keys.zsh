# Add SSH private keys to agent
for key in "$HOME/.ssh"/id_*; do
    [[ "$key" == *.pub ]] && continue
    ssh-add "$key" &>/dev/null
done &> /dev/null
