cd ~/code
docker compose run --rm clearbanc-api npm run local-config-files:local-compose
docker compose run --rm clearbanc-api npm run dev:dbsetup:no-pgpool
docker compose run --rm valuation-service npm run dev:dbsetup
docker compose up my.clearbanc.com clearbanc-api adjudication-service contract-service
