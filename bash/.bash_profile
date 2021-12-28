alias sb='source ~/.bash_profile'
alias b="bash"
alias vim="nvim"
alias vi="nvim"
alias l="exa -l"
alias la="exa -la"
export PYENV_ROOT="$HOME/.pyenv"
export EDITOR=nvim
export SOLN="4da1f2ae4ef03a88efef3ebbc745ac0d"

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
--color='bg+:#3c3836,\
bg+:#292929,\
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

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"

# git

function sq() {
  git add .;
  git commit --fixup $(git rev-parse head) -n;
  git rebase -i head~2 --autosquash;
}

gdiff () {
  git diff --name-only head~1;
}

rconf () { 
 vim -c 'Gvdiffsplit!' "$@";
}

prune () {
  git branch | egrep -v "(^\*|master)" | xargs git branch -D;
}

# psql

p () {
  usql "postgres://sor-reagent:$(pass show pgpassword)@localhost:5499/sor?sslmode=disable" "$@";
}

u () {
  usql "postgres://robbienohra@localhost:5432/robbienohra?sslmode=disable" "$@";
}

# react

dev () {
  npm run dev;
}

# restic

re () {
  GOOGLE_PROJECT_ID=robbie-329220 \
  GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-7d1a680d1c9a.json \
  RESTIC_PASSWORD=$(pass show restic) \
  restic -r gs:robbie-backups:/restic "$@";
}

# bash

srr () {
  sudo rm -r "$@";
}

v () {
  nvim .;
}

# b6i

ce () {
  cd ~/bsci/benchsci/frontend/ern;
}

cr () {
  cd ~/bsci/benchsci/frontend/reagent;
}

rgv () {
  rg --vimgrep "$@";
}

# nb

function bk() {
  nb bk --no-request "$@";
}

. "$HOME/.cargo/env"
