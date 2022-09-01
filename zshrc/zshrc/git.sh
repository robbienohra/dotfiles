# handle next conflict

function rconf() {
  a=$(git diff --name-only --diff-filter=U | sed -n 1p)
  if [[ $a ]]; then
    nvim -c 'Gvdiffsplit!' "$a"
  fi
  if [[ $1 ]]; then
    a=$(git diff --name-only --diff-filter=U | sed -n "$1"p)
    if [[ $a ]]; then
      nvim -c 'Gvdiffsplit!' "$a"
    fi
  fi
}

# echo next file with conflict
function conf() {
  if [[ $1 ]]; then
    a=$(git diff --name-only --diff-filter=U | sed -n "$1"p)
    if [[ $a ]]; then
      echo $a
    fi
  fi
}

# take remote change
function ours() {
  FILE=$(conf "$1")
  echo $FILE | xargs git checkout --ours
  git add $FILE
}

# take local change
function theirs() {
  FILE=$(conf "$1")
  echo $FILE | xargs git checkout --theirs
  git add $FILE
}

# open all conflicts across tabs
function rv() {
  FILES=$(git diff --name-only --diff-filter=U)
  echo $FILES | xargs nvim -c "tabdo Gvdiffsplit! | tabn" -p
}

# check if branch contains commit
function ct() {
  g branch --contains $1
}

function is-ancestor() {
  MAYBE_ANCESTOR_COMMIT=$1
  DESCENDENT_COMMIT=$2
  git merge-base --is-ancestor $1 $2
  echo $?
}

function sq() {
  git add .
  git commit --fixup $(git rev-parse head) -n
  git rebase -i head~2 --autosquash
}

function s() {
  gh pr view -w $(gh pr list --search "$@" --state merged --json number | jq '.[].number')
}

function di() {
  bash ~/dotfiles/diff.sh "$@"
}

function prune() {
  git branch | egrep -v "(^\*|$1)" | xargs git branch -D
}
