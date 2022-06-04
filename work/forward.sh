export NPM_TOKEN=$(pass show robbie/npm_token)
cd ~/code
gcloud config set project clearbanc-api-staging && kubectl config use-context gke_clearbanc-api-staging_us-central1_k8s-staging-live
gcloud container clusters get-credentials k8s-staging-live --region=us-central1
kubectl port-forward -n default svc/api-service 3333:80 & 
kubectl port-forward -n default svc/insights-service 3335:80 &
docker compose up my.clearbanc.com --force-recreate
