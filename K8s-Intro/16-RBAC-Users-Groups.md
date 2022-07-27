## Definition

Role-based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within your organization. RBAC authorization uses the rbac.authorization.k8s.io API group to drive authorization decisions, allowing you to dynamically configure policies through the Kubernetes API.

## Role vs ClusterRole

An RBAC Role or ClusterRole contains rules that represent a set of permissions. Permissions are purely additive (there are no "deny" rules). 

A Role always sets permissions within a particular namespace; when you create a Role, you have to specify the namespace it belongs in.

ClusterRole, by contrast, is a non-namespaced resource. The resources have different names (Role and ClusterRole) because a Kubernetes object always has to be either namespaced or not namespaced; it can't be both.

## RoleBinding vs ClusterRoleBinding

A role binding grants the permissions defined in a role to a user or set of users. It holds a list of subjects (users, groups, or service accounts), and a reference to the role being granted. A RoleBinding grants permissions within a specific namespace whereas a ClusterRoleBinding grants that access cluster-wide.

## Users and groups

All Kubernetes clusters have two categories of users: service accounts managed by Kubernetes, and normal users.

It is assumed that a cluster-independent service manages normal users in the following ways:
- an administrator distributing private keys
- a user store like Keystone or Google Accounts
- a file with a list of usernames and passwords
In this regard, Kubernetes does not have objects which represent normal user accounts. Normal users cannot be added to a cluster through an API call.

Even though normal user cannot be added via an API call, but any user that presents a valid certificate signed by the cluster’s certificate authority (CA) is considered authenticated. In this configuration, Kubernetes determines the username from the common name field in the ‘subject’ of the cert (e.g., “/CN=bob”). From there, the role based access control (RBAC) sub-system would determine whether the user is authorized to perform a specific operation on a resource.

## Create User Certificates

1. Generate the certificate
2. Create CSR file (Certificate Signing Request)
3. Sign CSR file using the Cluster CA

```
openssl genrsa -out ismael.key 2048
openssl req -new -key ismael.key -out ismael.csr -subj "/CN=ismael/O=dev"
sudo openssl x509 -req -in ismael.csr -CA /root/.minikube/ca.crt -CAkey /root/.minikube/ca.key -CAcreateserial -out ismael.crt -days 500
openssl x509 -in  ismael.crt  -noout -text
```

### Isolated env
kubectl config view  | grep server
docker run --rm -ti -v $PWD:/test -w /test  -v /root/.minikube/ca.crt:/ca.crt -v /usr/bin/kubectl:/usr/bin/kubectl alpine sh

### Configure kubectl for user
kubectl config set-cluster minikube --server=https://192.168.1.140:8443 --certificate-authority=/ca.crt
kubectl config set-credentials ismael --client-certificate=ismael.crt --client-key=ismael.key
kubectl config set-context ismael --cluster=minikube --user=ismael
kubectl config use-context ismael

## Make sure RBAC is enabled

`kubectl cluster-info dump | grep authorization-mode`  
`minikube start --vm-driver=none --extra-config=apiserver.authorization-mode=RBAC`  

## Create role for user

rbac-pods.yaml
```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["pods"]
    verbs: ["get", "watch", "list"]
    resourceNames: ["blue", "red"]
```

`kubectl get roles`  
`kubectl describe role pod-reader -n default`  

## Create RoleBinding for user

rbac-pods.yaml

```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
  - kind: User
    name: ismael
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role #this must be Role or ClusterRole
  name: pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```

`kubectl get rolebinding`  
`kubectl describe rolebinding read-pods`  

## ClusterRole

clusterrole.yaml
```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-pod-reader
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["pods"]
    verbs: ["get", "watch", "list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-read-pods
subjects:
  - kind: User
    name: ismael
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole #this must be Role or ClusterRole
  name: cluster-pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```

## Groups

group-role.yaml
```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: svc-cluster-group
rules:
  - apiGroups: [""]
    resources: ["services"]
    verbs: ["*"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: svc-cluster-group
subjects:
  - kind: Group
    name: dev
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole #this must be Role or ClusterRole
  name: svc-cluster-group # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```