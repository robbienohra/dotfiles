if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf --fish | source
zoxide init fish | source

abbr -a ch 'chezmoi'
abbr -a n 'nvim'

set -x FZF_DEFAULT_OPTS \
    "--history=$HOME/.fzf_history" \
    "--bind=ctrl-d:page-down,ctrl-u:page-up" \
    "--bind=ctrl-p:previous-history" \
    "--bind=ctrl-f:next-history" \
    "--bind=F2:toggle-preview" \
    "--info=hidden" \
    "--color=bg:#1a1b26" \
    "--color=bg+:#1a1b26"
