#!/bin/bash

# Script de déploiement automatique
echo "🚀 Déploiement de Biblio Pro..."

# Vérifier que kubectl est configuré
if ! kubectl cluster-info &> /dev/null; then
    echo "❌ kubectl n'est pas configuré correctement"
    exit 1
fi

# Créer le namespace
echo "📦 Création du namespace..."
kubectl apply -f k8s/namespace.yaml

# Déployer la base de données
echo "🗄️ Déploiement de la base de données..."
kubectl apply -f k8s/database.yaml

# Attendre que MySQL soit prêt
echo "⏳ Attente de MySQL..."
kubectl wait --for=condition=ready pod -l app=mysql -n biblio-pro --timeout=300s

# Déployer le backend
echo "🔧 Déploiement du backend..."
kubectl apply -f k8s/backend.yaml

# Déployer le frontend
echo "🎨 Déploiement du frontend..."
kubectl apply -f k8s/frontend.yaml

# Déployer le monitoring
echo "📊 Déploiement du monitoring..."
kubectl apply -f k8s/monitoring.yaml

# Vérifier le statut
echo "✅ Vérification du déploiement..."
kubectl get pods -n biblio-pro
kubectl get services -n biblio-pro

echo "🎉 Déploiement terminé !"
echo "📱 Accès à l'application : kubectl port-forward service/frontend-service 8080:80 -n biblio-pro"
echo "📊 Accès à Grafana : kubectl port-forward service/grafana-service 3000:3000 -n monitoring"