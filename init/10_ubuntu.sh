# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

e_header "Skipping Updating APT"
#NOTE(ameade): LOL I don't want to wait so long
# Update APT.
#e_header "Updating APT"
#sudo apt-get -qq update
#sudo apt-get -qq upgrade

# Install APT packages.
packages=(
  build-essential libssl-dev
  cmake python-dev
  git-core
  tree sl id3tool
  nmap telnet
  htop tmux
  eatmydata
)

list=()
for package in "${packages[@]}"; do
  if [[ ! "$(dpkg -l "$package" 2>/dev/null | grep "^ii  $package")" ]]; then
    list=("${list[@]}" "$package")
  fi
done

if (( ${#list[@]} > 0 )); then
  e_header "Installing APT packages: ${list[*]}"
  for package in "${list[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
