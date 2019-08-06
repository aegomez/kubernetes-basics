#!/bin/bash

# Expose the app publicly

log()
{
  echo -e "\033[34m\n*** $1 ...\033[0m"
}

# (1) Creating the service

# OPTIONAL: Verify that the app is running
# kubectl get pods

log "Listing cluster's current Services"
kubectl get services

log "Exposing a new service"
kubectl expose deployment/kubernetes-bootcamp \
  --type="LoadBalancer" \
  --port=8080

log "Listing updated Services"
kubectl get services

log "Service description"
kubectl describe services/kubernetes-bootcamp

log "Getting opened port"
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp \
  -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

log "Testing the app using curl"
curl $(minikube ip):$NODE_PORT
