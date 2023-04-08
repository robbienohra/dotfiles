[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--bind ctrl-p:previous-history \
--bind ctrl-f:next-history \
--bind ctrl-/:toggle-preview \
--info=hidden \
--color='spinner:#fb4934,\
hl:#DA9690,\
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

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow" # picked up by vim
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
