## Definition

In Docker, a volume is simply a directory on disk or in another Container. Lifetimes are not managed and until very recently there were only local-disk-backed volumes. Docker now provides volume drivers, but the functionality is very limited.

A Kubernetes volume, on the other hand, has an explicit lifetime - the same as the Pod that encloses it. Consequently, a volume outlives any Containers that run within the Pod, and data is preserved across Container restarts. Of course, when a Pod ceases to exist, the volume will cease to exist, too. Perhaps more importantly than this, Kubernetes supports many types of volumes, and a Pod can use any number of them simultaneously.

A process in a container sees a filesystem view composed from their Docker image and volumes. The Docker image is at the root of the filesystem hierarchy, and any volumes are mounted at the specified paths within the image. Volumes can not mount onto other volumes or have hard links to other volumes. Each Container in the Pod must independently specify where to mount each volume.

Using volumes we can create Stateful Applications.

## EmptyDir volume

An emptyDir volume is first created when a Pod is assigned to a Node, and exists as long as that Pod is running on that node. As the name says, it is initially empty. Containers in the Pod can all read and write the same files in the emptyDir volume, though that volume can be mounted at the same or different paths in each Container. When a Pod is removed from a node for any reason, the data in the emptyDir is deleted forever.

## HostPath volume

A hostPath volume mounts a file or directory from the host node's filesystem into your Pod. This is not something that most Pods will need, but it offers a powerful escape hatch for some applications.

## PV and PVC

A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. It is a resource in the cluster just like a node is a cluster resource. PVs are volume plugins like Volumes, but have a lifecycle independent of any individual Pod that uses the PV. This API object captures the details of the implementation of the storage, be that NFS, iSCSI, or a cloud-provider-specific storage system.

A PersistentVolumeClaim (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). Claims can request specific size and access modes.

![PVC](./images/pvc.png)


## Reclaim Policy

- Retain -- manual reclamation. The PV will be saved but not anymore claimed.
- Recycle -- basic scrub (rm -rf /thevolume/*). The PV will not be deleted but the content inside it.
- Delete -- associated storage asset such as AWS EBS, GCE PD, Azure Disk, or OpenStack Cinder volume is deleted. When erasing the PVC the PV will be deleted too.

## Creating EmptyDir volume

emptyDir.yaml

```
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
    - image: nginx:alpine
      name: test-container
      volumeMounts:
        - mountPath: /var/log/nginx
          name: vol
  volumes:
    - name: vol
      emptyDir: {}
```

## Create PV

First we create a hostPath in our minikube node, it will be the PV:

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: task-pv-volume
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
```

`kubectl get pv --show-labels`  
`kubectl describe pv task-pv-volume`  

## Create PVC (no labels)

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: task-pv-claim
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 3Gi
```
When we do not specify the PV we want to use K8s will get a PV that can satisfy the resource requests.

## Create PVC (labels)

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: task-pv-volume2
  labels:
    mysql: ready
spec:
  storageClassName: manual
  capacity:
    storage: 3Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data2"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: task-pv-claim2
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 4Gi
  selector: 
    matchLabels: 
      mysql: ready

```

## Adding PVC to POD

pvc-pod.yaml
```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: task-pv
  labels:
    mysql: ready
spec:
  storageClassName: manual
  capacity:
    storage: 4Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/tmp/media"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pv-claim
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 4Gi
  selector: 
    matchLabels: 
      mysql: ready
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
  labels:
    app: mysql
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
        - name: mysql
          image: mysql:5.7
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: "1234"
          volumeMounts:
            - mountPath: "/var/lib/mysql"
              name: mysql-lib
      volumes:
        - name: mysql-lib
          persistentVolumeClaim:
            claimName: mysql-pv-claim
```

## Storeage Class and Dynamic Provisioning

sc-pvc.yaml
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: sc-pvc
spec:
  storageClassName: standard
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 3Gi
```

If the PVC do not have a PV created before it will be created dinamically.

