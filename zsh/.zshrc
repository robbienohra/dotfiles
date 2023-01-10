for f in ~/zshrc/*.sh; do source $f; done
[[ $commands[kubectl] ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
