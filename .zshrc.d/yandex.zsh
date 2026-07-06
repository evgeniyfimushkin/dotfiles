# Yandex-specific configuration
# Only loaded on Yandex machines (hostname == yamac)
[[ "$(hostname)" != "yamac" ]] && return

# --- Yandex utilities below ---

alias infractl='ya tool infractl'
alias ci='ya tool ci'
alias cs='ya tool cs'
alias yav='ya tool yav'
alias sky='ya tool sky'

smclusters () {
    local host="$1"
    ssh "$host" "curl 'http://localhost:19000/clusters?format=json' -s" \
    | jq '.cluster_statuses[].name' \
    | sort -u
}

[ -f ~/.osy-tokens.sh ] && source ~/.osy-tokens.sh
