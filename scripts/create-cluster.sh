#!/bin/bash
# scripts/create-cluster.sh
# Define variables para el nombre del clúster, región, tipo de nodo y cantidad de nodos
CLUSTER_NAME="cluster-financiero"
REGION="us-east-1"
NODE_TYPE="t3.medium"
NODE_COUNT=2

# Comando para crear el clúster de EKS con eksctl
eksctl create cluster \
  --name $CLUSTER_NAME \
  --version 1.29 \
  --region $REGION \
  --nodegroup-name ng-$CLUSTER_NAME \
  --node-type $NODE_TYPE \
  --nodes $NODE_COUNT \
  --managed

# Configura el contexto de kubectl para conectarse al clúster recién creado
aws eks --region $REGION update-kubeconfig --name $CLUSTER_NAME

# Muestra los nodos activos del clúster
kubectl get nodes