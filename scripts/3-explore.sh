#!/bin/bash

# Explore the previously created app

RED="\033[31m"
NL="\033[34m\n***"
EOL="...\033[0m"

echo -e "${NL} Listing existing Pods ${EOL}"
#
kubectl get pods

echo -e "${NL} Displaying details about containers inside Pods ${EOL}"
#
kubectl describe pods

echo -e "${NL} Getting pod name ${EOL}"
POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo $POD_NAME

echo -e "${NL} Displaying container logs ${EOL}"
#
kubectl logs $POD_NAME

echo -e "${NL} Executing commands on the container ..."

echo -e "${NL} (1) List environment variables ${EOL}"
#
kubectl exec $POD_NAME env

echo -e "${NL} (2) Starting a bash session ...${RED}"
#
kubectl exec -it $POD_NAME bash 

# Inside the containers console:
# cat server.js
# exit

echo -e "${NL} Connection closed ${EOL}"
exit 0