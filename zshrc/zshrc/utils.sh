function srr() {
  sudo -A rm -r "$@"
}

function ch() {
  open http://google.com
}

function npm_login() {
  npm login --registry=https://npm.pkg.github.com
}

USER="postgres"
function u() {
  DB=$1
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable"
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
  usql "postgres://${USER}@localhost:5432/${DB}?sslmode=disable" -c $VAR
}

function lsp() {
  tail -f ~/.cache/nvim/lsp.log
}

function dev() {
  npm run dev
}

function re() {
  GOOGLE_PROJECT_ID=robbie-329220 \
    GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/robbie-329220-d0e67915e0de.json \
    RESTIC_PASSWORD=$(pass show restic) \
    restic -r gs:robbie-backups:/restic "$@"
}

function rand_str() {
  # https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
  LC_ALL=C tr -dc A-Za-z0-9 </dev/urandom | head -c 10
  echo ''
}
