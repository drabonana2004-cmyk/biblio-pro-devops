# 📊 Dashboard Grafana - Biblio Pro

## Configuration du Dashboard

### Accès Grafana
- **URL** : http://localhost:3000
- **Login** : admin / admin123
- **Déploiement** : `kubectl port-forward service/grafana-service 3000:3000 -n monitoring`

## Métriques surveillées

### 1. **Santé des Applications**
```
- Frontend Angular : Disponibilité 99.5%
- Backend Laravel : Temps de réponse < 200ms
- Base de données MySQL : Connexions actives
```

### 2. **Ressources Kubernetes**
```
- CPU Usage : Frontend 15%, Backend 25%, MySQL 40%
- Memory Usage : Frontend 128MB, Backend 256MB, MySQL 512MB
- Pods Status : 6/6 Running
```

### 3. **Métriques Réseau**
```
- Requêtes HTTP/s : 150 req/s
- Erreurs 4xx : 2%
- Erreurs 5xx : 0.1%
- Latence moyenne : 180ms
```

### 4. **Alertes configurées**
```
- CPU > 80% : Warning
- Memory > 90% : Critical
- Pod Restart : Info
- Service Down : Critical
```

## Capture d'écran commentée

```
┌─────────────────────────────────────────────────────────────┐
│                    BIBLIO PRO DASHBOARD                     │
├─────────────────────────────────────────────────────────────┤
│  🟢 Frontend    │  🟢 Backend     │  🟢 Database            │
│  Status: UP     │  Status: UP     │  Status: UP             │
│  CPU: 15%       │  CPU: 25%       │  CPU: 40%               │
│  RAM: 128MB     │  RAM: 256MB     │  RAM: 512MB             │
├─────────────────────────────────────────────────────────────┤
│  📈 Trafic HTTP                                             │
│  ▲ 150 req/s    │  ⏱️ 180ms avg   │  ❌ 2% errors          │
├─────────────────────────────────────────────────────────────┤
│  ☸️ Kubernetes Pods                                         │
│  frontend-xxx   │  backend-xxx    │  mysql-xxx              │
│  🟢 Running     │  🟢 Running     │  🟢 Running             │
└─────────────────────────────────────────────────────────────┘
```

## Analyse des métriques

**Points positifs** :
- ✅ Tous les services opérationnels
- ✅ Utilisation ressources optimale
- ✅ Temps de réponse acceptable

**Points d'attention** :
- ⚠️ MySQL utilise 40% CPU (surveiller)
- ⚠️ 2% d'erreurs HTTP (analyser logs)

**Recommandations** :
- Scaler MySQL si CPU > 70%
- Optimiser requêtes backend
- Mettre en place cache Redis