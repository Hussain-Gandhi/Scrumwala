#!/bin/bash

# Applying secret file
kubectl apply -f secret.yaml

# Applying configmap file
kubectl apply -f configmap.yaml

# Applying statefulset and service of mariadb
kubectl apply -f mariadb-statefulset.yaml

# Applying deployment and service of scrumwala
kubectl apply -f scrumwala-deployment.yaml

# Applying ingress
kubectl apply -f ingress.yaml

for n in {1..10}
do
    printf ". "
    sleep 2
done
echo ""

# Getting external ip
EXTERNALIP=$(kubectl get svc -n kube-system | grep traefik | awk '{ print $4 }')
echo "Open this link http://$EXTERNALIP:80 on your Browser."