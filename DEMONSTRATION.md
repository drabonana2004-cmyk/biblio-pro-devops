# 🚀 DÉMONSTRATION BIBLIO PRO DEVOPS

## ✅ Architecture implémentée

### 1. Conteneurisation Docker
- **Frontend** : `frontend/Dockerfile` - Application Angular avec Nginx
- **Backend** : `backend/Dockerfile` - API Laravel avec PHP-FPM

### 2. Orchestration Kubernetes
- **Namespace** : `k8s/namespace.yaml`
- **Base de données** : `k8s/database.yaml` - MySQL avec PVC
- **Backend** : `k8s/backend.yaml` - API avec ConfigMap et Secrets
- **Frontend** : `k8s/frontend.yaml` - Interface avec Ingress

### 3. Pipeline CI/CD
- **GitHub Actions** : `.github/workflows/ci-cd.yml`
- Tests automatiques → Build → Push → Deploy

### 4. Monitoring
- **Prometheus + Grafana** : `k8s/monitoring.yaml`
- Métriques complètes des applications

### 5. Documentation
- **README.md** : Guide complet de déploiement
- **Scripts** : `deploy.sh`, `docker-compose.dev.yml`

## 🎯 Commandes de déploiement

```bash
# Kubernetes
kubectl apply -f k8s/

# Docker Compose
docker-compose -f docker-compose.dev.yml up

# Accès applications
kubectl port-forward service/frontend-service 8080:80 -n biblio-pro
kubectl port-forward service/grafana-service 3000:3000 -n monitoring
```

## 📊 Résultat

✅ **Séparation des composants** : Frontend / Backend / Database  
✅ **Conteneurisation complète** : Dockerfiles optimisés  
✅ **Déploiement Kubernetes** : Manifests production-ready  
✅ **CI/CD automatisé** : Pipeline GitHub Actions  
✅ **Supervision** : Prometheus + Grafana  
✅ **Documentation** : Guide complet  

**Architecture DevOps complète et fonctionnelle !**