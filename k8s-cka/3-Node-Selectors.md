## Definition
Labels are key/value pairs that are attached to objects, such as pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system. Labels can be used to organize and to select subsets of objects. Labels can be attached to objects at creation time and subsequently added and modified at any time.

## Label Nodes
`kubectl label nodes <node-name> <key>=<value>`  

## Node Selector
```
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:         
  nodeSelector:
    app: my-app
    color: blue
```
