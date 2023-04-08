[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up \
# https://github.com/junegunn/fzf/issues/249
export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--bind ctrl-p:previous-history \
--bind ctrl-f:next-history \
--bind ctrl-/:toggle-preview \
--info=hidden \
--layout=reverse \
--color='spinner:#fb4934,\
hl:#928374,\
fg:#ebdbb2,\
header:#928374,\
info:#8ec07c,\
pointer:#fb4934,\
marker:#fb4934,\
fg+:#ebdbb2,\
bg+:-1,\
prompt:#fb4934,\
hl+:#fb4934,\
gutter:-1'"

export FZF_ALT_C_OPTS="
 --bind ctrl-d:page-down,ctrl-u:page-up \
 --preview-window right,50% \
 --preview 'exa --tree --level=2 {}'"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H -E .git --type d"
