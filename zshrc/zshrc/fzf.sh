[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^Y' fzf-history-widget

export FZF_COMPLETION_TRIGGER='*'

# --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up \
# https://github.com/junegunn/fzf/issues/249
export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--bind alt-p:previous-history \
--bind alt-n:next-history \
--bind ctrl-/:toggle-preview \
--color='spinner:#fb4934,\
hl:#928374,\
fg:#ebdbb2,\
header:#928374,\
info:#8ec07c,\
pointer:#fb4934,\
marker:#fb4934,\
fg+:#ebdbb2,\
prompt:#fb4934,\
hl+:#fb4934,\
gutter:-1'"

# export FZF_CTRL_T_OPTS="
#  --preview 'bat --style=numbers --color=always --line-range :500 {}' \
#  --preview-window right,50%"

export FZF_ALT_C_OPTS="
 --bind ctrl-d:page-down,ctrl-u:page-up \
 --preview-window right,50% \
 --preview 'exa --tree --level=2 {}'"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H -E .git --type d"

function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}


#######################
# fzf git
#######################

function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

function _gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window down:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/origin/##'
}

function _gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview-window down:50% \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

function join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
} b h

function fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

bindkey '^E' fzf-file-widget
