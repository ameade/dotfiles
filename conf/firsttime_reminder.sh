# Sourced once, at the end of a first-time dotfiles install.

cat <<EOF
First-time setup reminders:

  • Set up git identity if needed:
      git config --global user.name  "Your Name"
      git config --global user.email "you@example.com"
    (defaults are in ~/.gitconfig — edit the copy, not the repo)

  • Generate an SSH key if this machine needs one:
      ssh-keygen -t ed25519 -C "$USER@$(hostname)"
      cat ~/.ssh/id_ed25519.pub   # add to GitHub / authorized_keys

  • Put any secrets or machine-specific config (API tokens, work paths) in:
      ~/.bashrc.local         (gitignored, never committed)
EOF
