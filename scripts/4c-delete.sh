#!/bin/bash

log()
{
  echo -e "\033[34m\n*** $1 ...\033[0m"
}

# (3) Deleting the service

log "Deleting the service"
kubectl delete service -l run=kubernetes-bootcamp

log "Updated list of services"
kubectl get services

log "Trying to curl from outside the cluster"
curl $(minikube ip):$NODE_PORT

log "Trying to curl from inside the pod"
kubectl exec -it $POD_NAME curl localhost:8080
