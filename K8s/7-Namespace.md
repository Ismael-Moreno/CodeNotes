## Definition

Namespaces are intended for use in environments with many users spread across multiple teams, or projects. Namespaces provide a scope for names. Names of resources need to be unique within a namespace, but not across namespaces. Namespaces cannot be nested inside one another and each Kubernetes resource can only be in one namespace. Namespaces are a way to divide cluster resources between multiple users (via resource quota).

## Default namespaces

- default: The default namespace for objects with no other namespace
- kube-system: The namespace for objects created by the Kubernetes system
- kube-public: This namespace is created automatically and is readable by all users (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster. The public aspect of this namespace is only a convention, not a requirement.
- kube-node-lease: This namespace for the lease objects associated with each node which improves the performance of the node heartbeats as the cluster scales.

## Useful Commands

`kubectl get namespaces`  
`kubectl get pods --namespace default`  
`kubectl get pods -n default`  
`kubectl get all -n kube-public`  
`kubectl get namespaces --show-labels`  
`kubectl describe namespaces test-ns`  
`kubectl create namespace test-ns`  

## Create namespace

ns.yaml
```
---
apiVersion: v1
kind: Namespace
metadata:
  name: development
  labels:
    name: development
```

## DNS on namespaces

The DNS name for service on different namespaces is created as `svcName + nsName + svc.cluster.local`  
For this using the service 'backend-k8s-hands-on' and namespace 'ci' the DNS name is:  
`backend-k8s-hands-on.ci.svc.cluster.local`  

## Context

We can check the context we are using:

`kubectl config current-context`  
`kubectl config view`  

We can create a new context in order we do not need to set the -n namespace in all our commands:  
`kubectl config set-context ci-context --namespace=ci --cluster=minikube --user=minikube`  

In order to change to other context created previously:  
`kubectl config use-context ci-context`  

