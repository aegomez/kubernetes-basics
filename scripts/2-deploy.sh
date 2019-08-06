#!/bin/bash

# Deploy an app using kubectl

echo "*** Creating deployment from remote image ..."
# include full url for images hosted outside Docker hub
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080

echo "*** Listing current deployments ..."
kubectl get deployments

echo ""
echo "*** Tip: You may have to wait a few seconds for deployment to be ready ..."