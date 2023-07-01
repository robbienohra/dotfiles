for f in ~/zshrc/*.sh; do source $f; done
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# eval "$(zellij setup --generate-auto-start zsh)"
export ZELLIJ_CONFIG_FILE="$HOME/.config/zellij/config.kdl"
bindkey "\e[1;2D" backward-word
bindkey "\e[1;2C" forward-word
# bindkey "\eOH" beginning-of-line
# bindkey "\eOF" end-of-line
