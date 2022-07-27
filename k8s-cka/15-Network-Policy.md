## Definition
If you want to control traffic flow at the IP address or port level (OSI layer 3 or 4), then you might consider using Kubernetes NetworkPolicies for particular applications in your cluster. NetworkPolicies are an application-centric construct which allow you to specify how a pod is allowed to communicate with various network "entities". NetworkPolicies apply to a connection with a pod on one or both ends, and are not relevant to other connections.

## Define network policy
```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: db-policy
spec:
  podSelector:
    matchLabels:
      role: db
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          name: api-pod
      namespaceSelector:
        matchLabels:
          name: prod #until here is a single rule

    - ipBlock:
        cicdr: 192.168.5.10/32 #this is another rule
    ports:
    - protocol: TCP
      port: 3306
  
  egress:
    - to:
      - ipBlock:
          cicdr: 192.168.5.10/32
      ports:
      - protocol: TCP
        port: 80
```
> Once you allow ingress traffic it automatically allows egress traffic for the specified request.
