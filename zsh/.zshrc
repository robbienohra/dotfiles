#######################
# configs
#######################
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export ZK_NOTEBOOK_DIR=$HOME/nb

#######################
# fzf
#######################

function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

function fgs() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fbr - checkout git branch
function fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function function fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
function fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
function fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}


# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
function fco_preview() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

# --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up \
# https://github.com/junegunn/fzf/issues/249
export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
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
# pass
#######################

export NPM_TOKEN=$(pass show robbie/npm_token)

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

# DB="banking"
DB="postgres"
USER="postgres"
function u () {
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable" "$@";
}

function lsp () {
  tail -f ~/.cache/nvim/lsp.log;
}

function dev () {
  npm run dev;
}

function re () {
  GOOGLE_PROJECT_ID=robbie-329220 \
  GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-7d1a680d1c9a.json \
  RESTIC_PASSWORD=$(pass show restic) \
  restic -r gs:robbie-backups:/restic "$@";
}

function srr () {
  sudo -A rm -r "$@";
}

function su () {
  sudo -A "$@";
}

#######################
# gcloud
#######################

if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc'; fi

if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


#######################
# zsh
#######################
ZSH_DISABLE_COMPFIX=true
setopt auto_cd
setopt globdots
bindkey -r '^T'
bindkey -r '^R'
bindkey -r '^A'
bindkey '^N' fzf-file-widget
bindkey '^Y' fzf-history-widget
bindkey '^[a' beginning-of-line
bindkey '^[g' end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export PNPM_HOME="/Users/robbienohra/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
