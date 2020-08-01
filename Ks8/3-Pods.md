## Useful Cluster Commands
`minikube status`  
`minikube start`  
`minikube stop`  
`kubectl get pods`  
`kubectl api-versions` 
`kubectl api-resources`

## Creating a Pod

`kubectl run --generator=run-pod/v1 podtest --image=nginx:alpine`  
`kubectl get pod podtest`  
`kubectl describe pod podtest`  
`kubectl delete pod podtest`  

## Get yaml from pod

`kubectl get pod podtest -o yaml`  

## Get ip from pod

This ip is internal for the cluster.  
`kubectl describe pod podtest`  

## Access containers inside pod

`kubectl exec -ti podtest -- sh`  

## Check pod logs from outside

`kubectl logs podtest`  

## Create pods from manifest

pod.yaml
```
apiVersion: v1
kind: Pod
metadata:
    name: myapp-pod
spec:
    containers:
        -name: myapp-container
         image: nginx:alpine
---
apiVersion: v1
kind: Pod
metadata:
    name: myapp-pod
spec:
    containers:
        -name: myapp-container
         image: nginx:alpine
```

`kubectl apply -f pod.yaml`  
`kubectl delete -f pod.yaml`  

## Pods with more than one container

twocont.yaml
```
apiVersion: v1
kind: Pod
metadata:
    name: twocont
spec:
    containers:
        -name: cont1
         image: python:3.6-alpine
         command: ['sh', '-c', 'echo Container 1 > index.html && python -m http.server 8081']
        -name: cont2
         image: python:3.6-alpine
         command: ['sh', '-c', 'echo Container 1 > index.html && python -m http.server 8082']
```

## Labels

The labels allow us to filter and they are useful for deployments, replicasets...
```
apiVersion: v1
kind: Pod
metadata:
    name: myapp-pod
    labels:
        app: front
        env: dev
spec:
    containers:
        -name: myapp-container
         image: nginx:alpine
---
apiVersion: v1
kind: Pod
metadata:
    name: myapp-pod
    labels:
        app: backend
        env: dev
spec:
    containers:
        -name: myapp-container
         image: nginx:alpine
```

`kubectl get pods -l app=backend`  
`kubectl get pods -l app=front`  
`kubectl get pods -l env=dev`