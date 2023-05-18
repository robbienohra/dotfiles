function srr() {
  sudo rm -rf "$@"
}

function npm_login() {
  # npm login --registry=https://npm.pkg.github.com
  npm login --scope=@clearbanc --registry=https://npm.pkg.github.com
}

function u() {
  DB=$1
  usql "postgres://postgres@localhost:5432/${DB}?sslmode=disable"
}

function u-cols() {
  DB=$1
  TABLE=$2
  read -r -d '' VAR <<EOM
  SELECT column_name
  FROM information_schema.columns 
  WHERE table_schema = 'public' 
  AND table_name = '${TABLE}' 
  ORDER BY column_name ASC;
EOM
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable" -c "$VAR"
}

function rand_str() {
  # https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
  LC_ALL=C tr -dc a-z0-9 </dev/urandom | head -c 5
  echo ''
}

function fvi() {
  # https://stackoverflow.com/questions/65366464/is-there-a-way-to-cancel-fzf-by-pressing-escape
  local fname
  fname=$(fzf) || return
  v "$fname"
}

function fcd() {
  local dirname
  dirname=$(fd --type d --hidden -E .git . | fzf) || return
  cd "$dirname" || exit
}

function convip() {
  CONV=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})

  ip=""
  for byte in $(echo "${1}" | tr "." " "); do
    ip="${ip}.${CONV[${byte}]}"
  done
  echo "${ip:1}"
}

function nd() {
   ENTRY="$HOME/Documents/diary/$(date +'%Y-%m-%d').md"
   touch $ENTRY
   nvim $ENTRY
}
