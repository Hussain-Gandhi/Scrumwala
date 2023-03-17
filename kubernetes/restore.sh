kubectl cp /home/hussain.gandhi/personal/forge-backup.sql mariadb-statefulset-0:var/lib/mysql/forge-backup.sql
kubectl exec -it mariadb-statefulset-0 -- bash -c "cd /var/lib/mysql && mysql forge < forge-backup.sql --user=toor --password=toor"
