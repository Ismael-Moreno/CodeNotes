## Definition
We can schedule the pods to run in the node or groups of nodes that we choose. We can use the node name or selector tags to match the node labels.

## Scheduling with nodeName
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: node02 # schedule pod to specific node
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```
## Scheduling with nodeSelector
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
  nodeSelector:
    disktype: ssd
```
## Scheduling with nodeAffinity
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: disktype
          operator: In
          values:
          - ssd
```
## Scheduling with toleration
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: node.kubernetes.io/disktype
    operator: Exists
    effect: NoSchedule
```
## Scheduling with binds
```
apiVersion: v1
kind: Binding
metadata:
  name: nginx
target:
  apiVersion: v1
  kind: Node
  name: node02
```

