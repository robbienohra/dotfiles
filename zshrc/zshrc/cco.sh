NPM_TOKEN="" && command -v pass >/dev/null 2>&1 && NPM_TOKEN=$(pass show robbie/npm_token)
export NPM_TOKEN=$NPM_TOKEN

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120

function j() {
  kubectl -n jenkins port-forward svc/jenkins 8080:8080
}

function dc-fn() {
  docker compose "$*"
}

alias dc="dc-fn"

export CLUSTER_NAME=jenkins-test
export REGION_NAME=us-central1-a
export PROJECT_ID=clearbanc-build

export JENKINS_USER_ID=admin
export JENKINS_URL="http://localhost:8080/"

function t() {
  npm run test:unit "$@"
}
