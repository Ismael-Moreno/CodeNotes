## Why to set limits?

We should limit pods for the case the pod consumes the total resources of the node. If this happens the full node can go down.

# What resources can we limit?

- RAM: Can be limited by bytes, megabytes or gigabytes
- CPU: A cpu core is divided into 1000 milicores. We can limit by minicores or CPU percentage (0,1)

## Limits and requests

If the node where a Pod is running has enough of a resource available, it's possible (and allowed) for a container to use more resource than its request for that resource specifies. However, a container is not allowed to use more than its resource limit.  
Limits can be implemented either reactively (the system intervenes once it sees a violation) or by enforcement (the system prevents the container from ever exceeding the limit). Different runtimes can have different ways to implement the same restrictions.

```
apiVersion: v1
kind: Pod
metadata:
 name: memory-demo
spec:
 containers:
  - name: memory-demo-ctr
    image: polinux/stress
    resources:
     limits:
      memory: "200Mi"
     requests:
      memory: "100Mi"
    command: ["stress"]
    args: ["--vm", "1", "--vm-bytes", "150M", "--vm-hang", "1"]
```

Cuando el pod sobrepasa el limite de RAM se produce un OOMKilled (Out of Memory)  

