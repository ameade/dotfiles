# Debian/Ubuntu setup. Abort if apt isn't available (e.g. macOS).
command -v apt-get &>/dev/null || return 0

e_header "Updating apt package lists"
sudo apt-get -qq update

# A small set of genuinely useful command-line tools. Add your own here.
packages=(git tree ripgrep fzf bash-completion htop)

to_install=()
for pkg in "${packages[@]}"; do
  dpkg-query -W -f='${Status}' "$pkg" 2>/dev/null | grep -q "install ok installed" || to_install+=("$pkg")
done

if (( ${#to_install[@]} )); then
  e_header "Installing apt packages: ${to_install[*]}"
  sudo apt-get -qq install -y "${to_install[@]}"
else
  e_success "apt packages already installed."
fi
