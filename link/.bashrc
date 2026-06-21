# Add binaries into the path
PATH=~/.dotfiles/bin:$PATH
export PATH

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/source/$1.sh"
  else
    for file in ~/.dotfiles/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
# NOTE(ameade): commented out so we don't update automatically
# function dotfiles() {
#  ~/.dotfiles/bin/dotfiles "$@" && src
#}

src

export PATH=~/Library/Python/2.7/bin:~/.local/bin:$PATH



export CLAUDE_CODE_OAUTH_TOKEN="***REMOVED-LEAKED-TOKEN***"
