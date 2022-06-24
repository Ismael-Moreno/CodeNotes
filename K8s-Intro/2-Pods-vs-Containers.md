# Container Structure

Docker is written in Go and takes advantage of several features of the Linux kernel to deliver its functionality. Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.

These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace. Docker Engine uses namespaces such as the following on Linux:
- ipc namespace: Managing access to IPC resources (IPC: InterProcess Communication). Between two containers the processes cannot be shared. In the same container the processes can be shared and communicate between them.
- net namespace: Managing network interfaces (NET: Networking). Each container creates its own Network Namespace, making it to have its own IP and can communicate with its own. It can work only with the network tasks happening in the container network namespace.
- mnt namespace: Managing filesystem mount points (MNT: Mount). Allow to mount external filesystems inside the container.
- pid namespace: Process isolation (PID: Process ID). Each container can see only the PIDs of the process in its namespace (container).
- uts: Unix Timesharing System. Allow us to set a unique hostname for the container independent from the other containers.
Cgroups: A cgroup limits an application to a specific set of resources. Control groups allow Docker Engine to share available hardware resources to containers and optionally enforce limits and constraints.

# Connecting containers

- Docker Bridge: Docker uses the bridge network to connect all the containers to the same network and allow them to communicate.
- Kubernetes POD: Kubernetes allows to share namespaces between containers using PODs. It creates a dummy container in order to control the other containers in the same pod. The network of the dummy container is shared to the other ones and all of them have the same IP (localhost), the ipc namespace and uts of the dummy container is also shared. They share the same Namespace ID. At the end of the set up configuration the dummy container is stopped.

> A POD is one or more containers that share namespaces between them.