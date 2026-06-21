alias branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) %(committerdate:relative)' | head -n 10"
alias uuid='python3 -c "import uuid; print(uuid.uuid4())"'
