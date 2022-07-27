## Definition
The affinity spec ensures that pods are hosted in particular nodes. You cannot use advanced operators like "or" or "not in" in NodeSelectors. Thats where NOdeAffinity comes in.  

## Afinity types
Available:  
- requiredDuringSchedulingIgnoredDuringExecution
- preferredDuringSchedulingIgnoredDuringExecution  
Planned:  
- requiredDuringSchedulingIgnoredDuringExecution

## In
The In selector ensures that the pod is placed in any node whose label size has any value in the list of values specified here.
```
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: size
          operator: In
          values:
          - Large
```

## Not In
NodeAffinity will match the node if the node's label size is not in the list of values specified here.
```
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: size
          operator: NotIn
          values:
          - Small
```

## Exists
NodeAffinity will match the node if the node's label size exists.
```
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: size
          operator: Exists
```

