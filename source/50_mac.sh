# macOS-only aliases. Abort elsewhere.
[[ "$OSTYPE" =~ ^darwin ]] || return 0

alias sharecopy='pbpaste > /Users/Shared/clip.txt'   # my clipboard -> shared file
alias sharepaste='pbcopy < /Users/Shared/clip.txt'   # shared file -> my clipboard
