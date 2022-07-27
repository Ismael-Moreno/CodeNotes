## Definition

A ConfigMap is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume. A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.

A ConfigMap is an API object that lets you store configuration for other objects to use. Unlike most Kubernetes objects that have a spec, a ConfigMap has a data section to store items (keys) and their values. The name of a ConfigMap must be a valid DNS subdomain name.

## Ways to use ConfigMap inside a pod

There are four different ways that you can use a ConfigMap to configure a container inside a Pod:

- Command line arguments to the entrypoint of a container
- Environment variables for a container
- Add a file in read-only volume, for the application to read
- Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap

These different methods lend themselves to different ways of modeling the data being consumed. For the first three methods, the kubelet uses the data from the ConfigMap when it launches container(s) for a Pod.

The fourth method means you have to write code to read the ConfigMap and its data. However, because you're using the Kubernetes API directly, your application can subscribe to get updates whenever the ConfigMap changes, and react when that happens. By accessing the Kubernetes API directly, this technique also lets you access a ConfigMap in a different namespace.

## Create ConfigMap from file (cmd)

nginx.conf
```
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
```
`kubectl create configmap nginx-config --from-file=nginx.conf`  
`kubectl get cm`  
`kubectl describe configmap nginx-config`  
`kubectl create configmap nginx-config --from-file=/home/folder`  

## Create a configmap on yaml

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  nginx: |
    server {
      listen       80;
      server_name  localhost;

      location / {
          root   /usr/share/nginx/html;
          index  index.html index.htm;
      }

      error_page   500 502 503 504  /50x.html;
      location = /50x.html {
          root   /usr/share/nginx/html;
      }
    }
```

## Load config map on volume

```
---
apiVersion: v1
kind: ConfigMap
metadata:
 name: nginx-config
data:
 nginx: |
  server {
    listen       8080;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
  }
---
apiVersion: apps/v1
kind: Deployment
metadata:
 name: deployment-dev
 labels:
  app: front
spec:
 replicas: 2
 selector:
  matchLabels:
   app: front
 template:
  metadata:
   labels:
    app: front
  spec:
   containers:
    - name: nginx
      image: nginx:alpine
      volumeMounts:
       - name: nginx-vol
         mountPath: /etc/nginx/conf.d/
   volumes:
    - name: nginx-vol
      configMap:
       name: nginx-config
       items:
        - key: nginx
          path: default.conf
```

## Load configmap on env

```
---
apiVersion: v1
kind: ConfigMap
metadata:
 name: config-vars
data:
 db_host: dev.host.local
 db_user: dev-user
---
apiVersion: apps/v1
kind: Deployment
metadata:
 name: deployment-dev
 labels:
  app: front
spec:
 replicas: 2
 selector:
  matchLabels:
   app: front
 template:
  metadata:
   labels:
    app: front
  spec:
   containers:
    - name: nginx
      image: nginx:alpine
      env:
       - name: DB_HOST
         valueFrom:
          configMapKeyRef:
           name: config-vars
           key: db_host
       - name: DB_USER
         valueFrom:
          configMapKeyRef:
           name: config-vars
           key: db_user
```

## Load full configmap
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: webapp-color
  name: webapp-color
  namespace: default
spec:
  containers:
  - envFrom:
    - configMapRef:
        name: webapp-config-map
    image: kodekloud/webapp-color
    name: webapp-color
```

