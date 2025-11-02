@echo off
echo ========================================
echo    TEST LOCAL BIBLIO PRO
echo ========================================

echo [1] Test du backend PHP...
cd backend\public
php -S localhost:8000 index.php &
timeout 3
curl http://localhost:8000/health
echo.

echo [2] Structure des fichiers...
cd ..\..
dir frontend\Dockerfile
dir backend\Dockerfile
dir k8s\*.yaml

echo [3] Test terminé !
echo Backend: http://localhost:8000
pause