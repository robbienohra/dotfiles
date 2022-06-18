#######################
# zsh
#######################

# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
ZSH_DISABLE_COMPFIX=true
local WORDCHARS='*?_[]~=&;!#$%^(){}<>'
setopt auto_cd
setopt globdots
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
bindkey -r '^T'
bindkey -r '^R'
bindkey -r '^A'
bindkey -r '^G'
bindkey '^Y' fzf-history-widget
bindkey '^[a' beginning-of-line
bindkey '^[r' end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export PNPM_HOME="/Users/robbienohra/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

#######################
# configs
#######################
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export ZK_NOTEBOOK_DIR=$HOME/nb

#######################
# sources
#######################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"

#######################
# fzf
#######################

export FZF_COMPLETION_TRIGGER='*'

# --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up \
# https://github.com/junegunn/fzf/issues/249
export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--bind alt-p:previous-history \
--bind alt-n:next-history \
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

# fshow - git commit browser
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

function _gs() {
  is_in_git_repo || return
  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
  cut -d: -f1
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
} b r s h

# c - browse chrome history
function c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 2 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Profile 2/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

function fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
}

function __fo() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  local file=$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item}"
  done
)
  local ret=$?
  if [[ -n $file ]]; then
    $EDITOR $file
  fi
  return $ret
}

function fzf-open-file-widget() {
  __fo
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N fzf-open-file-widget
bindkey -r '^N'
bindkey '^N' fzf-open-file-widget
bindkey '^E' fzf-file-widget

#######################
# cco
#######################
export NPM_TOKEN=$(pass show robbie/npm_token)
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120

function j() {
  kubectl -n jenkins port-forward svc/jenkins 8080:8080
}

function dc-fn() {
  docker compose $*
}

alias dc="dc-fn"

export CLUSTER_NAME=jenkins-test
export REGION_NAME=us-central1-a
export PROJECT_ID=clearbanc-build

export JENKINS_USER_ID=admin
export JENKINS_URL="http://localhost:8080/"

#######################
# gnu-sed
#######################

export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# aliases
alias sz='source ~/.zshrc'
alias g='git'
alias b="bash"
alias v="nvim"
alias n="nvim ."
alias l="exa -l --icons"
alias la="exa -la"
alias lt="exa --tree"
export PYENV_ROOT="$HOME/.pyenv"
export EDITOR=nvim
export SUDO_ASKPASS=${HOME}/pass.sh

#######################
# git
#######################

function fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

function vdiff () {
  nvim -c 'Gvdiffsplit!' "$@";
}

function rconf () {
  if [[ $1 ]]; then
    a=$(git diff --name-only --diff-filter=U | sed -n "$1"p);
    if [[ $a ]]; then
      nvim -c 'Gvdiffsplit!' "$a";
    fi
  fi
}

function conf () {
  if [[ $1 ]]; then
    a=$(git diff --name-only --diff-filter=U | sed -n "$1"p);
    if [[ $a ]]; then
      echo $a
    fi
  fi
}

function ours () {
  FILE=$(conf "$1")
  echo $FILE | xargs git checkout --ours
  git add $FILE
}

function theirs () {
  FILE=$(conf "$1")
  echo $FILE | xargs git checkout --theirs
  git add $FILE
}

function br () {
  gh branch;
}

function rv () {
   FILES=$(git diff --name-only --diff-filter=U)                                    
   echo $FILES | xargs nvim -c "tabdo Gvdiffsplit! | tabn" -p                              
}

function ct () {
  g branch --contains $1
}

function dex () {
  g diff "$@" -- . ':(exclude)package-lock.json'
}

function is-ancestor () {
  MAYBE_ANCESTOR_COMMIT=$1;
  DESCENDENT_COMMIT=$2;
  git merge-base --is-ancestor $1 $2; echo $?;
}

function sq() {
  git add .;
  git commit --fixup $(git rev-parse head) -n;
  git rebase -i head~2 --autosquash;
}

function s () {
  gh pr view -w $(gh pr list --search "$@" --state merged --json number | jq '.[].number')
}

function di() {
  bash ~/dotfiles/diff.sh "$@";
}

function prune () {
  git branch | egrep -v "(^\*|master)" | xargs git branch -D;
}

function gch() {
  git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf);
}

#######################
# nav shortcuts
#######################

function co () {
  cd ~/code;
}

function my () {
  cd ~/code/my.clearbanc.com;
}

function comp () {
  cd ~/clear-components;
}

function dl () {
  cd ~/dotfiles
}

function sol () {
  cd $HOME/solns
}

function nb () {
  cd $HOME/nb
}

function sb () {
  cd $HOME/sandbox
}

#######################
# misc fns
#######################

# create a new blog post

function po () {
  (cd $HOME/robbie/content/posts && zk new --title $1)
}

function p () {
  (cd $HOME/robbie/content/posts && zk ed)
}

# function 

function rgl () {
  rg -p "$@" | less -RMFXK
}

function rgv () {
  rg --vimgrep "$@";
}

function ch () {
  open http://google.com;
}

function sp () {
  lsof -nP -iTCP -sTCP:LISTEN | rg "$@"
}

function dk() {
  docker kill $(docker ps -q)
}

function npm_login() {
  npm login --registry=https://npm.pkg.github.com
}

alias luamake=/Users/robbienohra/Documents/lua-language-server/3rd/luamake/luamake

USER="postgres"
function u () {
  DB=$1;
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable";
}

function u-cols () {
  DB=$1;
  TABLE=$2;
  read -r -d '' VAR << EOM
  SELECT column_name
  FROM information_schema.columns 
  WHERE table_schema = 'public' 
  AND table_name = '${TABLE}' 
  ORDER BY column_name ASC;
EOM
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable" -c $VAR
}

function lsp () {
  tail -f ~/.cache/nvim/lsp.log;
}

function plugins () {
  cd $HOME/.local/share/nvim/site/pack/packer/start
}

function dev () {
  npm run dev;
}

function re () {
  GOOGLE_PROJECT_ID=robbie-329220 \
  GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-d0e67915e0de.json \
  RESTIC_PASSWORD=$(pass show restic) \
  restic -r gs:robbie-backups:/restic "$@";
}

function srr () {
  sudo -A rm -r "$@";
}

function su () {
  sudo -A "$@";
}

function t () {
  npm run test:unit "$@";
}

function rand_str () {
# https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
 LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 10 ; echo ''
}

source /Users/robbienohra/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/780
if [[ $TERM == "alacritty" ]]; then
    ZSH_HIGHLIGHT_STYLES[comment]="fg=whatever_color,bold"
fi
#######################
# gcloud
#######################

if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc'; fi

if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
