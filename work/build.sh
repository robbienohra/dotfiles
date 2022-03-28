cd ~/code
docker compose build clearco-packages-14 && docker compose build clearco-packages-16
docker compose build contract-service clearbanc-api my.clearbanc.com adjudication-service aggregation-service valuation-service
