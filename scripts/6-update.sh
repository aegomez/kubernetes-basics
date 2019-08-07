#!/bin/bash

# Updating the application

log()
{
  echo -e "\033[31m\n*** $1 ...\033[0m"
}

###  i) Update the version of the app  ###


# OPTIONAL: list deployments and pods
# kubectl get deployments
# kubectl get pods

# OPTIONAL: view the current image version
# kubectl describe pods

# log "Updating the app\'s image to version 2"
## kubectl set image TYPE_NAME CONTAINER_N=IMAGE_N
# kubectl set image \
#   deployments/kubernetes-bootcamp \
#   kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2

# sleep 3

# log "Listing updated pods"
# kubectl get pods


###  (ii) Verify the update  ###


# log "Displaying Service description"
# kubectl describe services/kubernetes-bootcamp

# log "Getting the node port"
# NODE_PORT=$(kubectl get services/kubernetes-bootcamp \
#   -o go-template='{{(index .spec.ports 0).nodePort}}')
# echo NODE_PORT=$NODE_PORT

# log "Trying to request the port six times"
# for i in {1..6}
# do
#   sleep 1
#   log "Request $i/6"
#   curl $(minikube ip):$NODE_PORT
# done

# log "Trying to verify update using rollout status"
# kubectl rollout status deployments/kubernetes-bootcamp

# log "Displaying Pod description to confirm current image"
# kubectl describe pods


# ###  (iii) Update failure  ###


# log "Trying to update image to version 10"
# kubectl set image \
#   deployments/kubernetes-bootcamp \
#   kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10

# sleep 3

# log "Listing deployment status"
# kubectl get deployments

# log "Listing Pods"
# kubectl get pods

# log "Something went wrong, displaying pod desciption"
# kubectl describe pods


# ###  (iv) Rollback the update  ###


log "Rolling back to previous version"
kubectl rollout undo deployments/kubernetes-bootcamp

sleep 3

log "Listing updated Pods"
kubectl get pods
