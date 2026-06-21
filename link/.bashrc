# Add dotfiles binaries and user-local binaries to the path.
PATH=~/.dotfiles/bin:~/.local/bin:$PATH
export PATH

# Source all files in ~/.dotfiles/source/
# Usage: src          re-source everything
#        src 50_misc  re-source a single file (by name, without .sh)
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/source/$1.sh"
  else
    for file in ~/.dotfiles/source/*.sh; do
      source "$file"
    done
  fi
}

src

# Machine-specific or secret config (API tokens, work paths, etc.) lives here.
# This file is gitignored and never committed. Create it if you need it.
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
