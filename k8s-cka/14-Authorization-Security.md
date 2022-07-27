## Authorization modes
- Node: A special-purpose authorization mode that grants permissions to kubelets based on the pods they are scheduled to run. 
- ABAC: Attribute-based access control (ABAC) defines an access control paradigm whereby access rights are granted to users through the use of policies which combine attributes together. The policies can use any type of attributes (user attributes, resource attributes, object, environment attributes, etc).
- RBAC: Role-based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within an enterprise. In this context, access is the ability of an individual user to perform a specific task, such as view, create, or modify a file. 
- Webhook: A WebHook is an HTTP callback: an HTTP POST that occurs when something happens; a simple event-notification via HTTP POST. A web application implementing WebHooks will POST a message to a URL when certain things happen.

> The authorization order is defined in the kube-api-server service as `--authorization-mode=Node,RBAC,Webhook`. The authorization flow stops as soon as some mode authenticates it.


## Check own permissions
`kubectl auth can-i create deployments`  
`kubectl auth can-i delete nodes`  
`kubectl auth can-i create deployments --as dev-user`  
`kubectl auth can-i create deployments --as dev-user --namespace test`  

## Registry credentials
The credentials are used by the nodes docker runtimes to authenticate against the private repository.
```
kubectl create secret docker-registry regcred \
  --docker-server=server-endpoint.io
  --docker-username=user1
  --docker-password=passw0rd
  --docker-email=test@mail.com
```

nginx-pod.yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: server-endpoint.io/apps/internal-app
  imagePullSecrets:
  - name: regcred
```

## Security contexts
The container security context overrides the one of the pod. Capabilities are only supported at the container level.
```
apiVersion: v1
kind: Pod
metadata:
  name: web-pod
spec:
  containers:
    - name: ubuntu
      image: ubuntu
      command: ["sleep", "3600"]
      securityContext:
        runAsUser: 1000
        capabilities:
          add: ["MAC_ADMIN"]
```
```
apiVersion: v1
kind: Pod
metadata:
  name: web-pod
spec:
  securityContext:
    runAsUser: 1000
  containers:
    - name: ubuntu
      image: ubuntu
      command: ["sleep", "3600"]
```

