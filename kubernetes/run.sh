#!/bin/bash

# Applying secret file
kubectl apply -f secret.yaml

# Applying configmap file
kubectl apply -f configmap.yaml

# Applying statefulset and service of mariadb
kubectl apply -f mariadb-statefulset.yaml
MARIADB=$(kubectl get po | grep mariadb-statefulset-0 | awk '{ print $3 }')
while [ "$MARIADB" != "Running" ]
do
    sleep 1
    MARIADB=$(kubectl get po | grep mariadb-statefulset-0 | awk '{ print $3 }')
done

sleep 3

# Applying deployment and service of scrumwala
kubectl apply -f scrumwala-deployment.yaml
SCRUMWALA=$(kubectl get po | grep scrumwala-deployment | awk '{ print $3 }')
while [ "$SCRUMWALA" != "Running" ]
do
    sleep 1
    SCRUMWALA=$(kubectl get po | grep scrumwala-deployment | awk '{ print $3 }')
done

# Applying ingress
kubectl apply -f ingress.yaml

# Getting external ip from ingress service
EXTERNALIP=$(kubectl get svc -n kube-system | grep traefik | awk '{ print $4 }')
echo -e "\n\nOpen this link http://$EXTERNALIP:80 on your Browser."