[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

RED="#fb4934"
ORANGE="#FCA65F"
WHITE="#ebdbb2"

export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--bind ctrl-p:previous-history \
--bind ctrl-f:next-history \
--bind ctrl-/:toggle-preview \
--info=hidden \
--color='spinner:$RED,\
hl:$ORANGE,\
fg:$WHITE,\
header:#928374,\
info:#8ec07c,\
pointer:$RED,\
marker:$RED,\
fg+:$WHITE,\
bg+:-1,\
prompt:$RED,\
hl+:$RED,\
gutter:-1'"

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow" # picked up by vim
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window down:60% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/origin/##'
}
