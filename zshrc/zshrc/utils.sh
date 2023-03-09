function srr() {
  sudo -A rm -r "$@"
}

function ch() {
  open http://google.com
}

function npm_login() {
  # npm login --registry=https://npm.pkg.github.com
  npm login --scope=@clearbanc --registry=https://npm.pkg.github.com
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
  tail -f ~/.cache/nvim/mason.log
}

function dev() {
  npm run dev
}

function rand_str() {
  # https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
  LC_ALL=C tr -dc a-z0-9 </dev/urandom | head -c 5
  echo ''
}

function snip() {
  pbpaste | gh gist create -f "$1"
}

function gen-pairs() {
  openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048
  openssl rsa -in private.pem -pubout -out public.pem
}

function gen-token() {
  PEM=$(cat $1)
  ISSUER="foo"

  NOW=$(date +%s)
  IAT="${NOW}"
  EXP=$((${NOW} + 540))
  HEADER_RAW='{"alg":"RS256"}'
  HEADER=$(echo -n "${HEADER_RAW}" | openssl base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')
  PAYLOAD_RAW='{"iat":'"${IAT}"',"exp":'"${EXP}"',"iss":'\""${ISSUER}"\"',"sub":"bar"}'
  # PAYLOAD_RAW='{"iat":'"${IAT}"',"exp":'"${EXP}"',"iss":'\""${ISSUER}"\"'}'
  PAYLOAD=$(echo -n "${PAYLOAD_RAW}" | openssl base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')
  HEADER_PAYLOAD="${HEADER}"."${PAYLOAD}"
  SIGNATURE=$(openssl dgst -sha256 -sign <(echo -n "${PEM}") <(echo -n "${HEADER_PAYLOAD}") | openssl base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n')
  export TOKEN="${HEADER_PAYLOAD}"."${SIGNATURE}"
}

function jwtd() {
  if [[ -x $(command -v jq) ]]; then
    jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<<"${1}"
    echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
  fi
}
