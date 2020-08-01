## Definition

A Deployment provides declarative updates for Pods and ReplicaSets. You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments.

## Max Unavailable / Max Surge
Deployment ensures that only a certain number of Pods are down while they are being updated. By default, it ensures that at least 75% of the desired number of Pods are up (25% max unavailable).

Deployment also ensures that only a certain number of Pods are created above the desired number of Pods. By default, it ensures that at most 125% of the desired number of Pods are up (25% max surge).

For example, if you look at the above Deployment closely, you will see that it first created a new Pod, then deleted some old Pods, and created new ones. It does not kill old Pods until a sufficient number of new Pods have come up, and does not create new Pods until a sufficient number of old Pods have been killed. It makes sure that at least 2 Pods are available and that at max 4 Pods in total are available.

## Create Deployment

dep.yaml
```
# Makes reference to deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-test
  labels:
    app: front
# Makes reference to replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: front
  template:
    metadata:
      labels:
        app: front
# Makes reference to pods
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
        ports:
        - containerPort: 80
```
`kubectl apply -f dep.yaml`  

## Owner references

`kubectl get deployment`  
`kubectl get deployment --show-labels`  
`kubectl get rs --show-labels`  
`kubectl get pods --show-labels`  
`kubectl rollout status deployment deployment-test`  
`kubectl describe deployments deployment-test`  
`kubectl get deployments deployment-test -o yaml`  

Regarding the OwnerReferences, Deployment is parent of Replicaset and Replicaset is parent of Pods

## Rolling updates

We can update the pods inside yaml file and when applying again the deplyment will update the pods by recreating them.

## History and deployment revisions

After each deploy/redeploy a new rs is created and the pods from the old one are stoped. This allow to have a revision of each deployment:  
`kubectl rollout history deployment deployment-test`  
In order to check a specific revision:  
`kubectl rollout history deployment deployment-test --revision=3`  
By default the history limit is 10. It can be modified in the yaml deplyment spec:  
`revisionHistoryLimit:X`  

## Change cause

We can define the change cause of the deployment, recording the deployemnt command used or specifying a custom cause in the yaml file as metadata:
- `kubectl apply -f dep.yaml --record`
```
apiVersion: apps/v1
kind: Deployment
metadata:
    anotations:
        kubernetes.io/change-cause: "Custom cause"
```

