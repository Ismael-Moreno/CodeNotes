# What are the components of a Kubernetes cluster?

A working Kubernetes deployment is called a cluster. You can visualize a Kubernetes cluster as two parts: the control plane and the compute machines, or nodes. Each node is its own Linux® environment, and could be either a physical or virtual machine. Each node runs pods, which are made up of containers.

![Test](./images/architecture.svg)

# Kubernetes control plane (Master)

## Control plane

Here we find the Kubernetes components that control the cluster, along with data about the cluster’s state and configuration. These core Kubernetes components handle the important work of making sure your containers are running in sufficient numbers and with the necessary resources. The control plane is in constant contact with your compute machines.

## kube-apiserver

The Kubernetes API is the front end of the Kubernetes control plane, handling internal and external requests. The API server determines if a request is valid and, if it is, processes it. You can access the API through REST calls, through the kubectl command-line interface, or through other command-line tools such as kubeadm.

## kube-scheduler

The scheduler considers the resource needs of a pod, such as CPU or memory, along with the health of the cluster. Then it schedules the pod to an appropriate compute node. It places the things where they belong. It receives requests from the API and he manage to place the pod in the more suitable node. If no suitable node appears the request stay on pending status.

## kube-controller-manager

Controllers take care of actually running the cluster, and the Kubernetes controller-manager contains several controller functions in one. One controller consults the scheduler and makes sure the correct number of pods is running. If a pod goes down, another controller notices and responds. A controller connects services to pods, so requests go to the right endpoints. And there are controllers for creating accounts and API access tokens. It is conformed by Node Controller, Replication Controller, Endpoint Controller, Service Account Controller, Tokens Controller.

## etcd

Configuration data and information about the state of the cluster lives in etcd, a key-value store database. Fault-tolerant and distributed, etcd is designed to be the ultimate source of truth about your cluster. Here it is stored the status of the nodes, backups, rollbacks...

# Kubernetes node

## Node

A Kubernetes cluster needs at least one compute node, but will normally have many. Pods are scheduled and orchestrated to run on nodes. Need to scale up the capacity of your cluster? Add more nodes.

## kubelet

Each compute node contains a kubelet, a tiny application that communicates with the control plane. The kublet makes sure containers are running in a pod. When the control plane needs something to happen in a node, the kubelet executes the action. It talks to master, receive orders and send reports as well as communicate with docker in the node.

## kube-proxy

Each compute node also contains kube-proxy, a network proxy for facilitating Kubernetes networking services. The kube-proxy handles network communications inside or outside of your cluster—relying either on your operating system’s packet filtering layer, or forwarding the traffic itself.

## Container runtime engine

To run the containers, each compute node has a container runtime engine. Docker is one example, but Kubernetes supports other Open Container Initiative-compliant runtimes as well, such as rkt and CRI-O.

## Pods

A pod is the smallest and simplest unit in the Kubernetes object model. It represents a single instance of an application. Each pod is made up of a container or a series of tightly coupled containers, along with options that govern how the containers are run. Pods can be connected to persistent storage in order to run stateful applications.

![Simplified Schema](./images/architecture2.png)