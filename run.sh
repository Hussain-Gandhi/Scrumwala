#!/bin/bash

EXITCODE=$?

# Pull repo from GitHub
echo  "Downloading Scrumwala Repo"
git clone https://github.com/Hussain-Gandhi/Scrumwala.git

# Changing path to PWD(parent working directory) in scrumwala-deployment.yaml file.
SEARCH="/home/hussain.gandhi/personal/kubernetes/Scrumwala"
REPLACE=$(pwd)
sed "s/$SEARCH/$REPLACE/" scrumwala-deployment.yaml

echo "Appliying yaml files"

# Apply mariadb-statefulset.yaml to Kubernetes Cluster
kubectl apply -f mariadb-statefulset.yaml

kubectl get po

# Apply scrumwala-deployment.yaml to Kubernetes Cluster
kubectl apply -f scrumwala-deployment.yaml

kubectl get po

# Get the Cluster IP from scrumwala-service
CLUSTERIP=$(kubectl get svc | grep scrumwala-service | awk '{ print $3 }')

# Print the link using the CLUSTERIP
echo "Open this link http://$CLUSTERIP:8081 on your Browser."
