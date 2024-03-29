#!/bin/bash

# Expose the app publicly

log()
{
  echo -e "\033[34m\n*** $1 ...\033[0m"
}

###  (1) Creating the service  ###

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
NODE_PORT=$(kubectl get services/kubernetes-bootcamp \
  -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

log "Testing the app using curl"
curl $(minikube ip):$NODE_PORT


###  (2) Using labels  ###

log "Displaying deployment description"
kubectl describe deployment

log "Listing Pods using a Label value"
kubectl get pods -l run=kubernetes-bootcamp

log "Listing Services using a Label value"
kubectl get services -l run=kubernetes-bootcamp

log "Getting name of the Pod"
POD_NAME=$(kubectl get pods \
  -o go-template --template \
  '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}');
echo $POD_NAME

log "Applying a new label to the Pod"
kubectl label pod $POD_NAME app=v1

log "Displaying Pod's updated description"
kubectl describe pods $POD_NAME

log "Trying to list Pods using the updated label"
kubectl get pods -l app=v1


###  (3) Deleting the service  ###

# log "Deleting the service"
# kubectl delete service -l run=kubernetes-bootcamp

# log "Updated list of services"
# kubectl get services

# log "Trying to curl from outside the cluster"
# curl $(minikube ip):$NODE_PORT

# log "Trying to curl from inside the pod"
# kubectl exec -it $POD_NAME curl localhost:8080
