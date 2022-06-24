## Definition

When you (a human) access the cluster (for example, using kubectl), you are authenticated by the apiserver as a particular User Account (currently this is usually admin, unless your cluster administrator has customized your cluster). Processes in containers inside pods can also contact the apiserver. When they do, they are authenticated as a particular Service Account (for example, default). When you create a pod, if you do not specify a service account, it is automatically assigned the default service account in the same namespace.

`kubectl get serviceaccounts`  
`kubectl get sa`  
`kubectl describe sa default`  

## Create SA

sa.yaml
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: build-robot
```

When we create a pod the Service Account (token, cert and namespace) is mounted as a volume using a volume binding.

## API requests

From a pod in the cluster we can send request to the API but they will fail due to authentication (we use the kubernetes svc name or ip):  
`curl https://kubernetes/api/v1/namespaces/default/pods --insecure`  

We can try to send a request using curl and JWT as the token is stored in the pod as a volume:  
`TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)`  
`curl -H "Authorization: Bearer ${TOKEN}" https://kubernetes/api/v1 --insecure`

## Asign SA to deployment

sa.yaml
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-sa
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test
  labels:
    app: front
# Makes reference to replicaset
spec:
  replicas: 1
  selector:
    matchLabels:
      app: front
  template:
    metadata:
      labels:
        app: front
    # Makes reference to pods
    spec:
      serviceAccountName: my-sa
      containers:
        - name: nginx
          image: nginx:alpine
```

## Apply roles to SA

sa.yaml
```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: sa-reader
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["pods"]
    verbs: ["get", "watch", "list"]
  - apiGroups: ["apps"] # "" indicates the core API group
    resources: ["deployments", "replicasets"]
    verbs: ["get", "watch", "list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: sa-pods
  namespace: default
subjects:
  - kind: ServiceAccount
    name: my-sa # "name" is case sensitive
    apiGroup: ""
roleRef:
  kind: Role #this must be Role or ClusterRole
  name: sa-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```