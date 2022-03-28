cd ~/code
gsutil cp -R gs://clearcalc-model-serialization-dev/ ./model_executor/serialized_models
docker compose build clearco-packages-14 && docker compose build clearco-packages-16
docker compose build contract-service clearbanc-api my.clearbanc.com adjudication-service aggregation-service valuation-service
docker compose run --rm clearbanc-api npm run local-config-files:local-compose
docker compose run --rm clearbanc-api npm run dev:dbsetup:no-pgpool
docker compose run --rm valuation-service npm run dev:dbsetup
docker compose up my.clearbanc.com clearbanc-api adjudication-service contract-service
