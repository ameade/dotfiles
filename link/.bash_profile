# For login shells: load .bashrc so interactive config applies everywhere.
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Google Cloud SDK (only if installed, relative to $HOME).
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then source "$HOME/google-cloud-sdk/path.bash.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/google-cloud-sdk/completion.bash.inc"; fi

# Machine-specific login-shell config (PATH for brew kegs, JDKs, etc.).
[[ -f ~/.bash_profile.local ]] && source ~/.bash_profile.local
