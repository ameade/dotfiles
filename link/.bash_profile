if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ameade/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ameade/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ameade/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ameade/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/openjdk/bin:$PATH"
