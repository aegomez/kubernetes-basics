#!/bin/bash

log()
{
  echo -e "\033[34m\n*** $1 ...\033[0m"
}

# (2) Using labels

log "Displaying deployment description"
kubectl describe deployment

log "Listing Pods using the label value"
kubectl get pods -l run=kubernetes-bootcamp

log "Listing Services using the label value"
kubectl get services -l run=kubernetes-bootcamp

log "Getting name of the Pod"
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}');
echo $POD_NAME

log "Applying a new label to the Pod"
kubectl label pod $POD_NAME app=v1

log "Displaying Pod's updated description"
kubectl describe pods $POD_NAME

log "Trying to list Pods using the updated label"
kubectl get pods -l app=v1
