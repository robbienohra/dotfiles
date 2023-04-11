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

function lsp() {
  tail -f ~/.cache/nvim/mason.log
}

function rand_str() {
  # https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
  LC_ALL=C tr -dc a-z0-9 </dev/urandom | head -c 5
  echo ''
}

function dr() {
  dcli p root
}

function et() {
  exa --tree "$@"
}
