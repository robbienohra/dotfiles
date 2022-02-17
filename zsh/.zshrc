ZSH_DISABLE_COMPFIX=true

export ZSH="/Users/robbienohra/.oh-my-zsh"

plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(starship init zsh)"
 
setopt globdots

# fnm
export PATH=/Users/robbienohra/.fnm:$PATH
eval "$(fnm env)"

# zoxide
eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/robbienohra/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

alias sz='source ~/.zshrc'
alias g='git'
alias b="bash"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias l="exa -l"
alias la="exa -la"
export PYENV_ROOT="$HOME/.pyenv"
export EDITOR=nvim
export SOLN="4da1f2ae4ef03a88efef3ebbc745ac0d"
export SUDO_ASKPASS=${HOME}/pass.sh

# gpg

GPG_TTY=$(tty)
export GPG_TTY

# tmux

alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tk="t kill-server"
alias t0="t a -t 0"

# fzf

export FZF_DEFAULT_OPTS="
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

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"

# git

function sq() {
  git add .;
  git commit --fixup $(git rev-parse head) -n;
  git rebase -i head~2 --autosquash;
}

function rconf () { 
 vim -c 'Gvdiffsplit!' "$@";
}

function prune () {
  git branch | egrep -v "(^\*|master)" | xargs git branch -D;
}

# psql

function p () {
  usql "postgres://sor-reagent:$(pass show pgpassword)@localhost:5499/sor?sslmode=disable" "$@";
}

function u () {
  usql "postgres://robbienohra@localhost:5432/robbienohra?sslmode=disable" "$@";
}

# react

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

# b6i

function ce () {
  cd ~/bsci/benchsci/frontend/ern;
}

function cr () {
  cd ~/bsci/benchsci/frontend/reagent;
}

function rgv () {
  rg --vimgrep "$@";
}

function dt () {
  vi ~/dotfiles/nvim/.config/nvim/init.vim;
}

# notes

function n () {
  v "$HOME/notes/src/$@ $(date +%s).md";
}

function n1 () {
  v "$HOME/notes/code/web/src/routes/$(date +%s).svelte";
}

function web () {
  cd "$HOME/notes/code/web";
}

function no () {
  cd $HOME/notes
}

function up() {
  g com
  g fe
  g pomr
  g c-
}

. "$HOME/.cargo/env"
