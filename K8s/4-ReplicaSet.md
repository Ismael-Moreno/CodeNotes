## Definition

A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods.

## How a ReplicaSet works?

A ReplicaSet is defined with fields, including a selector (labels) that specifies how to identify Pods it can acquire, a number of replicas indicating how many Pods it should be maintaining, and a pod template specifying the data of new Pods it should create to meet the number of replicas criteria. A ReplicaSet then fulfills its purpose by creating and deleting Pods as needed to reach the desired number. When a ReplicaSet needs to create new Pods, it uses its Pod template.

A ReplicaSet is linked to its Pods via the Pods' metadata.ownerReferences field, which specifies what resource the current object is owned by. All Pods acquired by a ReplicaSet have their owning ReplicaSet's identifying information within their ownerReferences field. It's through this link that the ReplicaSet knows of the state of the Pods it is maintaining and plans accordingly.

A ReplicaSet identifies new Pods to acquire by using its selector. If there is a Pod that has no OwnerReference or the OwnerReference is not a Controller and it matches a ReplicaSet's selector, it will be immediately acquired by said ReplicaSet.

## Create replicaset

rs.yaml
```
# References the replicaset
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: rs-test
  labels:
    app: rs-test
spec:
  replicas: 3
  selector:
    matchLabels:
      app: pod-label

# From now on references the pods
  template:
    metadata:
      labels:
        app: pod-label
    spec:
      containers:
      - name: nginx:alpine
        image: gcr.io/google_samples/gb-frontend:v3
```
`kubectl apply -f rs.yaml`  
`kubectl get pods -l app=pod-label`  
`kubectl get rs`  
`kubectl get replicaset`  

## Owner references

We can cehck the OwnerReferences in the pod and the UID in the replicaset to check the pod belogs to the replicaset.  

`kubectl get pod X -o yaml`  
`kubectl describe rs rs-test`  
`kubectl get rs rs-test -o yaml`  

## Pods adoption by ReplicaSet

We have external pods with the same labels as replicaset:  
`kubectl label pods podtest app=pod-label`  
The replicaset will adopt it because it match the selector used in the yaml file.