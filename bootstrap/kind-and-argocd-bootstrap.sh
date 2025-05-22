#!/bin/bash
set -e

# Create KIND cluster
kind create cluster --config kind/kind-cluster.yaml

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Expose ArgoCD Server
kubectl port-forward svc/argocd-server -n argocd 8080:443 &
echo "ArgoCD is available at https://localhost:8080"