@echo off
echo ========================================
echo    VERIFICATION BIBLIO PRO DEVOPS
echo ========================================

echo.
echo [1/6] Structure du projet...
if exist "frontend\Dockerfile" (echo ✓ Frontend Dockerfile) else (echo ✗ Frontend Dockerfile manquant)
if exist "backend\Dockerfile" (echo ✓ Backend Dockerfile) else (echo ✗ Backend Dockerfile manquant)
if exist "k8s\namespace.yaml" (echo ✓ Kubernetes manifests) else (echo ✗ Kubernetes manifests manquants)
if exist ".github\workflows\ci-cd.yml" (echo ✓ Pipeline CI/CD) else (echo ✗ Pipeline CI/CD manquant)

echo.
echo [2/6] Applications...
if exist "frontend\src\app\app.component.ts" (echo ✓ Application Angular) else (echo ✗ Application Angular manquante)
if exist "backend\public\index.php" (echo ✓ API Laravel) else (echo ✗ API Laravel manquante)

echo.
echo [3/6] Configuration Kubernetes...
if exist "k8s\database.yaml" (echo ✓ Base de données MySQL) else (echo ✗ Configuration MySQL manquante)
if exist "k8s\monitoring.yaml" (echo ✓ Monitoring Prometheus/Grafana) else (echo ✗ Monitoring manquant)

echo.
echo [4/6] Docker Compose...
if exist "docker-compose.dev.yml" (echo ✓ Docker Compose dev) else (echo ✗ Docker Compose manquant)

echo.
echo [5/6] Scripts utiles...
if exist "deploy.sh" (echo ✓ Script de déploiement) else (echo ✗ Script de déploiement manquant)
if exist "README.md" (echo ✓ Documentation) else (echo ✗ Documentation manquante)

echo.
echo [6/6] Test de syntaxe Docker...
docker --version >nul 2>&1
if %errorlevel%==0 (
    echo ✓ Docker disponible
    echo   Pour tester: docker-compose -f docker-compose.dev.yml up
) else (
    echo ⚠ Docker non disponible - installer Docker Desktop
)

echo.
echo ========================================
echo    VERIFICATION TERMINEE
echo ========================================
echo.
echo Prochaines étapes:
echo 1. Démarrer Docker Desktop
echo 2. Exécuter: docker-compose -f docker-compose.dev.yml up
echo 3. Tester l'application sur http://localhost:4200
echo 4. Pousser sur GitHub pour déclencher le pipeline CI/CD

pause