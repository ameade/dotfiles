# macOS-only setup. Abort if not macOS.
[[ "$OSTYPE" =~ ^darwin ]] || return 0

# Install Homebrew if missing.
if ! command -v brew &>/dev/null; then
  e_header "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Make brew available for the rest of this run (Apple Silicon vs Intel paths).
  [[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
  [[ -x /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"
fi

if command -v brew &>/dev/null; then
  # A small set of genuinely useful command-line tools. Add your own here.
  formulae=(git tree ripgrep fzf bash-completion@2 htop)

  to_install=()
  installed="$(brew list --formula -1 2>/dev/null)"
  for f in "${formulae[@]}"; do
    grep -qx "$f" <<<"$installed" || grep -qx "${f%@*}" <<<"$installed" || to_install+=("$f")
  done

  if (( ${#to_install[@]} )); then
    e_header "Installing Homebrew formulae: ${to_install[*]}"
    brew install "${to_install[@]}"
  else
    e_success "Homebrew formulae already installed."
  fi
fi
