## Definition
If a node is down K8s consider all the pods dead and terminate them after 5 minutes. These pods are recreated in other nodes. This time is known as "Pod Eviction Timeout" and can be set in kube-controller-manager.  
`kube-controller-manager --pod-eviction-timeout=5m0s`  
When the node comes out online again, it is blank, all the non replicated pods will be lost. To avoid this issue we can use the drain node way.

## Drain node
We can drain a node and move all his pods to another node in the cluster. The pods are gracefully terminated and moved to another node. No pods can be scheduled in this node until you remove the restriction.  
`kubectl drain node-1`  

## Uncordon node
In order to allow the schedule of pods in a drained node, we can uncordon the node.  
`kubectl uncordon node-1`  

## Cordon node
In order to prevent the schedule of pods in a drained node, we can cordon the node. This will not remove any pod as drain would do.  
`kubectl cordon node-1`  

