cd ~/code
gcloud config set project clearbanc-api-staging && kubectl config use-context gke_clearbanc-api-staging_us-central1_staging-core
gcloud container clusters get-credentials staging-core --region=us-central1
kubectl port-forward -n default svc/api-service 3333:80 & 
# kubectl port-forward -n default svc/insights-service 3335:80 &
# docker compose up my.clearbanc.com --force-recreate
