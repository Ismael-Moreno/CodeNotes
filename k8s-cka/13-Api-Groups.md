## Definition
API groups make it easier to extend the Kubernetes API. The API group is specified in a REST path and in the apiVersion field of a serialized object. There are several API groups in Kubernetes:
- The core (also called legacy) group is found at REST path /api/v1. The core group is not specified as part of the apiVersion field, for example, apiVersion: v1.
- The named groups are at REST path /apis/$GROUP_NAME/$VERSION and use apiVersion: $GROUP_NAME/$VERSION (for example, apiVersion: batch/v1).

## Check API groups
`kubectl proxy`  
`curl http://localhost:6443 -k`  
`curl http://localhost:6443/apis -k`  
`curl http://localhost:6443/ -k --key admin.key --cert admin.crt --cacert ca.crt`  

