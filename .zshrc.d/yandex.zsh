# Yandex-specific configuration
# Only loaded on Yandex machines (hostname == yamac)
[[ "$(hostname)" != "yamac" ]] && return

# --- Yandex utilities below ---

alias infractl='ya tool infractl'