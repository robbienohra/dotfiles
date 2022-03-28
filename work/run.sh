cd ~/code
docker compose run --rm clearbanc-api npm run local-config-files:local-compose
docker compose run --rm clearbanc-api npm run dev:dbsetup:no-pgpool
docker compose run --rm valuation-service npm run dev:dbsetup
