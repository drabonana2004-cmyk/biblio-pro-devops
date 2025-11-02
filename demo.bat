@echo off
echo ========================================
echo    DEMONSTRATION BIBLIO PRO DEVOPS
echo ========================================

echo [1] Architecture créée...
echo ✓ Frontend Angular avec Dockerfile
echo ✓ Backend Laravel avec Dockerfile  
echo ✓ Base de données MySQL
echo ✓ Manifests Kubernetes complets
echo ✓ Pipeline CI/CD GitHub Actions
echo ✓ Monitoring Prometheus/Grafana

echo.
echo [2] Fichiers Kubernetes...
kubectl apply -f k8s/namespace.yaml --dry-run=client
kubectl apply -f k8s/database.yaml --dry-run=client
kubectl apply -f k8s/backend.yaml --dry-run=client
kubectl apply -f k8s/frontend.yaml --dry-run=client

echo.
echo [3] Pipeline CI/CD...
type .github\workflows\ci-cd.yml | findstr "name:"
type .github\workflows\ci-cd.yml | findstr "jobs:"

echo.
echo [4] Monitoring...
type k8s\monitoring.yaml | findstr "Deployment\|Service"

echo.
echo ========================================
echo    DEMONSTRATION TERMINEE
echo ========================================
echo Repository GitHub: https://github.com/VOTRE_USERNAME/biblio-pro-devops
pause