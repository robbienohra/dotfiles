ZSH_DISABLE_COMPFIX=true
setopt auto_cd
setopt globdots

#######################
# configs
#######################
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export ZK_NOTEBOOK_DIR=$HOME/nb

#######################
# fzf
#######################

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up \
# https://github.com/junegunn/fzf/issues/249
export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--color='bg+:#3c3836,\
bg+:#282828,\
spinner:#fb4934,\
hl:#928374,\
fg:#ebdbb2,\
header:#928374,\
info:#8ec07c,\
pointer:#fb4934,\
marker:#fb4934,\
fg+:#ebdbb2,\
prompt:#fb4934,\
hl+:#fb4934'"

export FZF_CTRL_T_OPTS="
 --preview 'bat --style=numbers --color=always --line-range :500 {}' \
 --preview-window right,50%"

export FZF_ALT_C_OPTS="
 --bind ctrl-d:page-down,ctrl-u:page-up \
 --preview-window right,50% \
 --preview 'exa --tree --level=2 {}'"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H -E .git --type d"

#######################
# sources
#######################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/robbienohra/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

#######################
# cco
#######################

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120

function j() {
  kubectl -n jenkins port-forward svc/jenkins 8080:8080
}

dc-fn() {
  docker compose $*
}

alias dc="dc-fn"

export CLUSTER_NAME=jenkins-test
export REGION_NAME=us-central1-a
export PROJECT_ID=clearbanc-build

export JENKINS_USER_ID=admin
export JENKINS_URL="http://localhost:8080/"

#######################
# pass
#######################

export NPM_TOKEN=$(pass show robbie/npm_token)
# export JENKINS_API_TOKEN=$(pass show robbie/jenkins)
# GPG_TTY=$(tty)
# export GPG_TTY

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

# tmux

alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tk="t kill-server"
alias t0="t a -t 0"


#######################
# git
#######################

function rconf () { 
  nvim -c 'Gvdiffsplit!' "$@";
}

function br () {
  gh branch;
}

function conf (){
  git diff --name-only --diff-filter=U;
}

function rv () {
   FILES=$(git diff --name-only --diff-filter=U)                                    
   echo $FILES | xargs nvim -c "tabdo Gvdiffsplit! | tabn" -p                              
}

function ct () {
  g branch --contains $1
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
# psql
#######################

# DB="banking"
DB="postgres"
USER="postgres"
function u () {
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable" "$@";
}

# lsp

function lsp () {
  tail -f ~/.cache/nvim/lsp.log;
}

# npm
function dev () {
  npm run dev;
}

# restic
function re () {
  GOOGLE_PROJECT_ID=robbie-329220 \
  GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-7d1a680d1c9a.json \
  RESTIC_PASSWORD=$(pass show restic) \
  restic -r gs:robbie-backups:/restic "$@";
}

# bash
function srr () {
  sudo -A rm -r "$@";
}

function su () {
  sudo -A "$@";
}

# work

function co () {
  cd ~/code;
}

function my () {
  cd ~/code/my.clearbanc.com;
}

function comp () {
  cd ~/clear-components;
}

function fu () {
  fnm use;
}

# ripgrep

function rgl () {
  rg -p "$@" | less -RMFXK
}

function rgv () {
  rg --vimgrep "$@";
}

# shortcuts

function ch () {
  open http://google.com;
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PNPM_HOME="/Users/robbienohra/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

bindkey -r '^T'
bindkey -r '^R'
bindkey -r '^A'
bindkey '^N' fzf-file-widget
bindkey '^Y' fzf-history-widget
bindkey '^[a' beginning-of-line
bindkey '^[g' end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
