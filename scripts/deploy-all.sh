#!/bin/bash
# scripts/deploy-all.sh
# Finaliza el script si algún comando falla
set -e

echo "[INFO] Aplicando manifiestos Kubernetes..."

# Aplica todos los manifiestos de Kubernetes para desplegar la aplicación financiera
kubectl apply -f manifests/00-namespace.yaml || true  # Crea el namespace, ignora error si ya existe
kubectl apply -f manifests/01-configmap.yaml         # ConfigMap para el backend
kubectl apply -f manifests/02-secret.yaml            # Secret para la base de datos
kubectl apply -f manifests/04-database-pvc.yaml      # PersistentVolumeClaim para PostgreSQL
kubectl apply -f manifests/03-database-deployment.yaml  # Despliegue de la base de datos
kubectl apply -f manifests/05-backend-deployment.yaml   # Despliegue del backend
kubectl apply -f manifests/06-backend-service.yaml      # Servicio interno del backend
kubectl apply -f manifests/07-frontend-deployment.yaml  # Despliegue del frontend
kubectl apply -f manifests/08-frontend-service.yaml     # LoadBalancer del frontend
kubectl apply -f manifests/09-ingress.yaml              # Reglas de ingreso (opcional)

echo "[INFO] Despliegue completado."

# Muestra todos los recursos desplegados en Kubernetes
kubectl get all