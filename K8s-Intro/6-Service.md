## Definition

An abstract way to expose an application running on a set of Pods as a network service. Kubernetes gives Pods their own IP addresses and a single DNS name for a set of Pods, and can load-balance across them (Round Robin).  

## Service Resources
In Kubernetes, a Service is an abstraction which defines a logical set of Pods and a policy by which to access them (sometimes this pattern is called a micro-service). The set of Pods targeted by a Service is usually determined by a selector.

## Endpoints

The endpoint store an IP list of the pods contained in the service in order to communicate with the pods without having to know the real ip of the pods, we just need to send the request to the service.

## Create Service

svc.yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: front
# Makes reference to replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: front
  template:
    metadata:
      labels:
        app: front
# Makes reference to pods
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
---
apiVersion: v1
# Makes reference to the service
kind: Service
metadata:
  name: my-service
  labels:
    app: front
spec:
  type: ClusterIP
  selector:
    app: front
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 80
```
`kubectl get services`  
`get svc -l app=front`  
`kubectl describe svc my-service`  
`kubectl get endpoints`  
`kubectl get pods -l app=front -o wide`  

## Services and DNS

When using services we can use the service name as DNS, its pods heritates a DNS. For example in our case, we can enter inside a pod and then perform a curl to my-service:8080  

## Service types

- ClusterIP: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType. (type: ClusterIP)
- NodePort: Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting `<NodeIP>:<NodePort>` (type: NodePort)
- LoadBalancer: Exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.

