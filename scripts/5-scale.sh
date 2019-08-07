#!/bin/bash

# Scaling the application

log()
{
  echo -e "\033[31m\n*** $1 ...\033[0m"
}


###  (i) Scale Up  ###

log "Listing deployments"
kubectl get deployments

log "Scaling up the app"
kubectl scale deployments/kubernetes-bootcamp --replicas=4

log "Listing updated deployments"
kubectl get deployments

log "Listing Pods"
kubectl get pods -o wide

log "Displaying deployments event log"
kubectl describe deployments/kubernetes-bootcamp


###  (ii) Load Balancing  ###

# log "Displaying describe service"
# kubectl describe services/kubernetes-bootcamp

# log "Getting Node Port"
# NODE_PORT=$(kubectl get services/kubernetes-bootcamp \
#   -o go-template='{{(index .spec.ports 0).nodePort}}')
# echo NODE_PORT=$NODE_PORT

# log "Requesting to the port five times"
# for i in {1..5}
# do
#   log "Request # $i"
#   curl $(minikube ip):$NODE_PORT
#   sleep 1
# done


###  (iii) Scale Down  ###

# log "Scaling down to 2 replicas"
# kubectl scale deployments/kubernetes-bootcamp \
#   --replicas=2

# log "Listing updated deployments"
# kubectl get deployments

# log "Listing updated Pods"
# kubectl get pods -o wide
