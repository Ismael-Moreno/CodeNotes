## Version pairing
The main component is the kube-apiserver as every component need to talk to it. The controller and scheduler can be X - 1 version and the kubelet and proxy can be X - 2. Kubectl can be X + 1 or X - 1. You should upgrade to follow the k8s support only up to the recent 3 minor versions (including the current). The recommended upgrade aproach is to go trough each version at a time.

## Upgrade order
First you update the master nodes and then the worker nodes. While the master is being upgraded the control plane components go down briefly. All admin functions in cluster are disabled and you cannot access the cluster using kubectl or any other api. There are three strategies to upgrade the workers:
- Upgrade the worker nodes one by one.
- Upgrade the worker nodes in parallel (downtime).
- Add new worker nodes to the cluster and decommission the old ones.

