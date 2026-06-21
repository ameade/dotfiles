# Kubernetes helpers. Only active when kubectl is installed.
command -v kubectl &>/dev/null || return 0

source <(kubectl completion bash)
alias k="kubectl"
alias kt="kubectl -n trident"
alias ks="kubectl -n kube-system"

# Work-specific shortcuts (harmless if the paths don't exist).
alias gt="cd ~/host/go/src/github.com/netapp/trident"
alias gw="cd ~/host/go/src/whelk"
