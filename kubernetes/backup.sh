kubectl exec -it mariadb-statefulset-0 -- bash -c "cd /var/lib/mysql && cd /var/lib/mysql && mysqldump forge > forge-backup.sql --user=toor --password=toor"
kubectl cp mariadb-statefulset-0:var/lib/mysql/forge-backup.sql /home/hussain.gandhi/personal/forge-backup.sql
