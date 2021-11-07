alias sb='source ~/.bash_profile'
alias b="bash"
alias vim="nvim"
alias vi="nvim"
alias l="exa -l"
export PYENV_ROOT="$HOME/.pyenv"

# tmux

alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# fzf

export FZF_DEFAULT_OPTS='--bind "ctrl-y:execute-silent(echo {} | pbcopy)+abort"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d"

# git

fbr() {
  git fetch
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

function sq() {
  git add .;
  git commit --fixup $(git rev-parse head);
  git rebase -i head~2 --autosquash;
}


gdiff () {
  git diff --name-only head~1;
}

rconf () { 
 vim -c 'Gvdiffsplit!' "$@"
}

prune () {
  git branch | egrep -v "(^\*|master)" | xargs git branch -D
}

# psql

p () {
  usql "postgres://sor-reagent:$(pass show pgpassword)@localhost:5499/sor?sslmode=disable" "$@";
}

# react

dev () {
  npm run dev
}

# restic

re () {
  GOOGLE_PROJECT_ID=robbie-329220 \
  GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-7d1a680d1c9a.json \
  RESTIC_PASSWORD=$(pass show restic) \
  restic -r gs:robbie-backups:/restic "$@";
}

conf () {
  GOOGLE_PROJECT_ID=robbie-329220 \
  GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-7d1a680d1c9a.json \
  RESTIC_PASSWORD=$(pass show restic) \
  restic -r gs:robbie-backups:/restic \
    backup \
    ~/.zshrc \
    ~/.config/alacritty/alacritty.yml \
    ~/.config/starship.toml \
    ~/.config/gh/config.yml \
    ~/.gitconfig \
    ~/.nbrc \
    ~/.config/bat/config \
    ~/RectangleConfig.json
}

srr () {
  sudo rm -r "$@"
}

v () {
  nvim .
}

# configs

via () { 
  nvim ~/.config/alacritty/alacritty.yml 
}

viv () {
  nvim ~/.config/nvim/init.vim
}

vib () {
  nvim ~/.bash_profile
}

vit () {
  nvim ~/.tmux.conf
}

vig () {
  nvim ~/.gitconfig
}

# b6i

cf () {
  cd ~/bsci/benchsci/frontend/ern
}

cr () {
  cd ~/bsci/benchsci/sites/reagent
}

# nb

day () {
  cd ~/robbie;
  nb use diary;
  TODAY=$(date +"%Y-%m-%d");
  FILE="/Users/robbienohra/robbie/diary/$TODAY.md"
  if [[ -f "$FILE" ]]; then
    nb edit "$TODAY.md";
  else
    nb add "$TODAY.md";
  fi
}

note () {
  cd ~/robbie;
  nb use notes;
  nb add;
}

