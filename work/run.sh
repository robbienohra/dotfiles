cd ~/code
docker compose run --rm clearbanc-api npm run local-config-files:local-compose
docker compose run --rm clearbanc-api npm run dev:dbsetup:no-pgpool
docker compose run --rm valuation-service npm run dev:dbsetup
docker compose run --rm clearbanc-api npm run migrate:schema -- --target=banking --db.database=banking --db.host=postgres --db.port=5432 --db.username=postgres --db.password=null up
# docker compose up my.clearbanc.com clearbanc-api adjudication-service contract-service
# valuation-service
# for adjudication
# u -f common/create-admin-script.sql
# pw in documentation (WIP) 
# admin.clearbanc.com
# for running admin portal locally
