## Backup Candidates
- Resource configuration (namespace, secret, configmap, etc) => Github/Velero
- ETCD Cluster (--data-dir backup, snapshot builtin solution)
- Persistent Volumes

## etcdctl

[k8s restore etcd docs](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster)  
[etcd recovery guide](https://github.com/etcd-io/website/blob/main/content/en/docs/v3.5/op-guide/recovery.md)  
```
export ETCDCTL_API=3 etcdctl snapshot save snapshot.db \
--endpoint=http://localhost:2379 \
--cacert=/etc/etcd/ca.crt \
--cert=/etc/etcd/etcd_server.crt \
--key=/etc/etcd/etcd_serv
```
`etcdctl snapshot status snapshot.db`  
`service kube-apiserver stop`  
`etcdctl snapshot restore snapshot.db --data-dir /var/lib/etcd-from-backup`  
> We can configure the etcd service to use this directory (--data-dir) created from the restore command above.  

`service etcd restart`  
`service kube-apiserver restart`  

