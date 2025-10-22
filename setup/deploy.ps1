Write-Host "Deploying Argo Ecommerce Project..." -ForegroundColor Green

# Create namespace
kubectl create namespace ecommerce --dry-run=client -o yaml | kubectl apply -f -

# Apply Argo Events
kubectl apply -f workflows/event-sources.yaml -n argo-events
kubectl apply -f workflows/sensor.yaml -n argo-events

# Apply ApplicationSet
kubectl apply -f manifests/application-set.yaml -n argocd

Write-Host " Deployment completed!" -ForegroundColor Green
Write-Host "
Next steps:" -ForegroundColor Yellow
Write-Host "1. Create git-credentials secret:" -ForegroundColor White
Write-Host "   kubectl create secret generic git-credentials --from-literal=token=YOUR_GH_TOKEN -n argo-workflows" -ForegroundColor Gray
Write-Host "2. Update GitHub URL in manifests/application-set.yaml" -ForegroundColor White
Write-Host "3. Push this code to GitHub" -ForegroundColor White
Write-Host "4. Configure DockerHub webhooks" -ForegroundColor White



