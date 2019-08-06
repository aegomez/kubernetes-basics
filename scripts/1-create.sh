#!/bin/bash

# Create a Kubernetes cluster with Minikube

echo "*** Checking if minikube is properly installed ..."
minikube version

echo "*** Starting the cluster ..."
minikube start

echo "*** Checking if command line interface is installed ..."
kubectl version

echo "*** Displaying the cluster details ..."
kubectl cluster-info

echo "*** Displaying nodes in cluster ..."
kubectl get nodes