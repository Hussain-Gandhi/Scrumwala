#!/bin/bash

# Deleting Ingress
kubectl delete -f ingress.yaml

# Deleting Scrumwala Deployment
kubectl delete -f scrumwala-deployment.yaml
SCRUMWALA=$(kubectl get po | grep scrumwala-deployment | awk '{ print $3 }')
while [ "$SCRUMWALA" != "" ]
do
    sleep 1
    SCRUMWALA=$(kubectl get po | grep scrumwala-deployment | awk '{ print $3 }')
done

sleep 3

# Deleting Mariadb StatefulSet
kubectl delete -f mariadb-statefulset.yaml
MARIADB=$(kubectl get po | grep mariadb-statefulset-0 | awk '{ print $3 }')
while [ "$MARIADB" != "" ]
do
    sleep 1
    MARIADB=$(kubectl get po | grep mariadb-statefulset-0 | awk '{ print $3 }')
done

# Deleting Mariadb PVC
kubectl delete pvc mariadb-pvctemplates-mariadb-statefulset-0

# Deleting ConfigMap
kubectl delete -f configmap.yaml

# Deleting Secret
kubectl delete -f secret.yaml