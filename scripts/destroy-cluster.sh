#!/bin/bash
# scripts/delete-cluster.sh

# Define variables del clúster a eliminar
CLUSTER_NAME="cluster-financiero"
REGION="us-east-1"

# Comando para eliminar el clúster
eksctl delete cluster \
  --name $CLUSTER_NAME \
  --region $REGION

echo "Clúster $CLUSTER_NAME eliminado."
