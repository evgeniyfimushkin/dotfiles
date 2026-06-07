# Only set aliases if the target commands exist
if command -v kubecolor &>/dev/null; then
    alias kubectl="kubecolor"
fi

if command -v codium &>/dev/null; then
    alias code="codium"
fi
