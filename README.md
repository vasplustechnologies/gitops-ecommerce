# Argo CD Ecommerce Project

## Quick Start

1. Update GitHub URL in manifests/application-set.yaml
2. Run deployment: .\setup\deploy.ps1
3. Create secret:
   kubectl create secret generic git-credentials --from-literal=token=YOUR_TOKEN -n argo-workflows
4. Push code to GitHub
5. Configure DockerHub webhooks

## Services
- order-service: mofwili/order-service:1.0.0
- inventory-service: mofwili/inventory-service:1.0.0
- notification-service: mofwili/notification-service:1.0.0
