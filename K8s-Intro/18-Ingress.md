## Definition

Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.

```
    internet
        |
   [ Ingress ]
   --|-----|--
   [ Services ]
```

An Ingress may be configured to give Services externally-reachable URLs, load balance traffic, terminate SSL / TLS, and offer name based virtual hosting. An Ingress controller is responsible for fulfilling the Ingress, usually with a load balancer, though it may also configure your edge router or additional frontends to help handle the traffic. An Ingress does not expose arbitrary ports or protocols. Exposing services other than HTTP and HTTPS to the internet typically uses a service of type Service.Type=NodePort or Service.Type=LoadBalancer.  

## Create Ingress Controller

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/baremetal/deploy.yaml`  

## Expose deployment by Ingress

### The deployment for testing will be "ingress-app.yaml":

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ingress-app
  labels:
    app: front
# Makes reference to replicaset
spec:
  replicas: 2
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
          command:
            [
              "sh",
              "-c",
              "echo VERSION 1.0 desde $HOSTNAME > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'",
            ]
---
apiVersion: v1
# Makes reference to the service
kind: Service
metadata:
  name: ingress-app-svc
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

### The ingress rules to expose the app "ingress-rules.yaml":  

```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ingress-test
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    http:
      paths:
      - path: /appv1
        backend:
          serviceName: api-server-svc
          servicePort: 8080
```

Then we can access the app using IP:nodeport/appv1

### Apply rules by host and path:

ingress-rules.host.yaml
```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ingress-test
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - host: app.mydomain.com
      http:
        paths:
          - backend:
              serviceName: ingress-app-svc
              servicePort: 8080
```

