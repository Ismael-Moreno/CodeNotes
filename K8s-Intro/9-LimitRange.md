## Definition

With Limit Range, we can restrict resource consumption and creation as by default containers run with unbounded computing resources on a Kubernetes cluster. A Pod can consume as much CPU and memory as defined by the Limit Range. A Limit Range provides constraints on:
- Minimum and maximum resources
- Minimum and maximum storage request per PersistentVolumeClaim
- A ratio between request and limit for a resource in a namespace.
- Set default request/limit for computing resources

## Create a limit range

```
apiVersion: v1
kind: LimitRange
metadata:
  name: mem-limit-range
spec:
  limits:
  - default:
      memory: 512Mi
    defaultRequest:
      memory: 256Mi
    type: Container
```

## Max and min values

```
apiVersion: v1
kind: LimitRange
metadata:
  name: cpu-min-max-demo-lr
spec:
  limits:
  - max:
      cpu: "800m"
    min:
      cpu: "200m"
    type: Container
```