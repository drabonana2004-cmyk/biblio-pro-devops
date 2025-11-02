# Biblio Pro - Architecture DevOps

## 🏗️ Architecture

Cette application suit une architecture microservices avec :
- **Frontend** : Angular (conteneurisé avec Nginx)
- **Backend** : Laravel API (conteneurisé avec PHP-FPM + Nginx)
- **Base de données** : MySQL (déployée sur Kubernetes)
- **Orchestration** : Kubernetes
- **CI/CD** : GitHub Actions
- **Monitoring** : Prometheus + Grafana

## 📁 Structure du projet

```
biblio_pro/
├── frontend/                 # Application Angular
│   ├── Dockerfile
│   └── nginx.conf
├── backend/                  # API Laravel
│   ├── Dockerfile
│   └── nginx-backend.conf
├── k8s/                     # Manifests Kubernetes
│   ├── namespace.yaml
│   ├── database.yaml
│   ├── backend.yaml
│   ├── frontend.yaml
│   └── monitoring.yaml
├── .github/workflows/       # Pipeline CI/CD
│   └── ci-cd.yml
└── README.md
```

## 🚀 Déploiement

### Prérequis
- Docker
- Kubernetes cluster (minikube, kind, ou cloud)
- kubectl configuré
- GitHub repository

### 1. Build local des images

```bash
# Frontend
cd frontend
docker build -t biblio-frontend:latest .

# Backend
cd ../backend
docker build -t biblio-backend:latest .
```

### 2. Déploiement sur Kubernetes

```bash
# Créer le namespace
kubectl apply -f k8s/namespace.yaml

# Déployer la base de données
kubectl apply -f k8s/database.yaml

# Déployer le backend
kubectl apply -f k8s/backend.yaml

# Déployer le frontend
kubectl apply -f k8s/frontend.yaml

# Déployer le monitoring
kubectl apply -f k8s/monitoring.yaml
```

### 3. Vérification du déploiement

```bash
# Vérifier les pods
kubectl get pods -n biblio-pro

# Vérifier les services
kubectl get services -n biblio-pro

# Accéder à l'application
kubectl port-forward service/frontend-service 8080:80 -n biblio-pro
```

## 🔄 Pipeline CI/CD

Le pipeline GitHub Actions se déclenche sur :
- Push sur `main` et `develop`
- Pull requests vers `main`

### Étapes du pipeline :
1. **Test** : Tests unitaires frontend et backend
2. **Build & Push** : Construction et publication des images Docker
3. **Deploy** : Déploiement automatique sur Kubernetes

### Configuration requise :
- `GITHUB_TOKEN` : Token d'accès GitHub (automatique)
- `KUBE_CONFIG` : Configuration kubectl encodée en base64

## 📊 Monitoring

### Accès Grafana
```bash
kubectl port-forward service/grafana-service 3000:3000 -n monitoring
```
- URL : http://localhost:3000
- Login : admin / admin123

### Métriques surveillées :
- Utilisation CPU/Mémoire des pods
- Latence des requêtes HTTP
- Disponibilité des services
- Métriques de base de données

## 🛠️ Commandes utiles

### Logs des applications
```bash
# Logs frontend
kubectl logs -f deployment/frontend -n biblio-pro

# Logs backend
kubectl logs -f deployment/backend -n biblio-pro

# Logs base de données
kubectl logs -f deployment/mysql -n biblio-pro
```

### Mise à jour des déploiements
```bash
# Redémarrer le frontend
kubectl rollout restart deployment/frontend -n biblio-pro

# Redémarrer le backend
kubectl rollout restart deployment/backend -n biblio-pro
```

### Scaling
```bash
# Scaler le frontend
kubectl scale deployment frontend --replicas=3 -n biblio-pro

# Scaler le backend
kubectl scale deployment backend --replicas=3 -n biblio-pro
```

## 🔧 Configuration

### Variables d'environnement Backend
- `DB_HOST` : mysql-service
- `DB_PORT` : 3306
- `DB_DATABASE` : biblio_pro
- `DB_USERNAME` : biblio_user
- `DB_PASSWORD` : (depuis Secret Kubernetes)

### Secrets Kubernetes
Les mots de passe sont stockés dans des Secrets :
```bash
# Créer un nouveau secret
kubectl create secret generic mysql-secret \
  --from-literal=mysql-root-password=nouveaumotdepasse \
  --from-literal=mysql-password=nouveaumotdepasse \
  -n biblio-pro
```

## 🚨 Troubleshooting

### Problèmes courants

1. **Pods en CrashLoopBackOff**
   ```bash
   kubectl describe pod <pod-name> -n biblio-pro
   kubectl logs <pod-name> -n biblio-pro
   ```

2. **Service non accessible**
   ```bash
   kubectl get endpoints -n biblio-pro
   kubectl describe service <service-name> -n biblio-pro
   ```

3. **Base de données non connectée**
   ```bash
   kubectl exec -it deployment/mysql -n biblio-pro -- mysql -u root -p
   ```

## 📈 Améliorations futures

- [ ] Mise en place d'un service mesh (Istio)
- [ ] Intégration de tests de sécurité (SAST/DAST)
- [ ] Backup automatique de la base de données
- [ ] Mise en place d'un registry privé
- [ ] Configuration SSL/TLS avec cert-manager
- [ ] Monitoring avancé avec alertes
- [ ] Déploiement multi-environnements (dev/staging/prod)