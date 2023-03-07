# Deleting Ingress
kubectl delete ingress scrumwala-ingress

# Deleting Scrumwala Deployment
kubectl delete deployments scrumwala-deployment

# It takes around 25 to 30 to completly delete the Scrumwala Deployment
for n in {1..15}
do
    printf ". "
    sleep 2
done
echo ""

# Deleting Mariadb StatefulSet
kubectl delete statefulsets.apps mariadb-statefulset

# Deleting Mariadb PVC
kubectl delete pvc mariadb-pvctemplates-mariadb-statefulset-0

# Deleting mariadb and scrumwala services
kubectl delete svc mariadb-service scrumwala-service

# Deleting ConfigMap
kubectl delete configmaps scrumwala-config

# Deleting Secret
kubectl delete secrets scrumwala-secret