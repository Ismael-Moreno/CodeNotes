## Definition

Kubernetes uses liveness probes to know when to restart a container. If a container is unresponsive—perhaps the application is deadlocked due to a multi-threading defect—restarting the container can make the application more available, despite the defect.

Kubernetes uses readiness probes to decide when the container is available for accepting traffic. The readiness probe is used to control which pods are used as the backends for a service. A pod is considered ready when all of its containers are ready. If a pod is not ready, it is removed from service load balancers. For example, if a container loads a large cache at startup and takes minutes to start, you do not want to send requests to this container until it is ready, or the requests will fail—you want to route requests to other pods, which are capable of servicing requests.

## How are probes executed

Kubernetes supports three mechanisms for implementing liveness and readiness probes:  
- Running a command inside a container. If the command succeeds, it returns 0, and the kubelet considers the container to be alive and healthy. If the command returns a non-zero value, the kubelet kills the container and restarts it.
- Making an HTTP request against a container. the kubelet sends an HTTP GET request to the server that is running in the container. Any code greater than or equal to 200 and less than 400 indicates success. Any other code indicates failure.
- Opening a TCP socket against a container. Kubelet will attempt to open a socket to your container on the specified port. If it can establish a connection, the container is considered healthy, if it can’t it is considered a failure.

## Kind of probes

- Readiness. The kubelet uses readiness probes to know when a container is ready to start accepting traffic. A Pod is considered ready when all of its containers are ready. When a Pod is not ready, it is removed from Service load balancers.
- Liveness. The kubelet uses liveness probes to know when to restart a container. For example, liveness probes could catch a deadlock, where an application is running, but unable to make progress.
- Startup. The kubelet uses startup probes to know when a container application has started. If such a probe is configured, it disables liveness and readiness checks until it succeeds, making sure those probes don't interfere with the application startup. This can be used to adopt liveness checks on slow starting containers.

## Concepts

Probes have a number of fields that you can use to more precisely control the behavior of liveness and readiness checks:
- initialDelaySeconds: Number of seconds after the container has started before liveness or readiness probes are initiated. Defaults to 0 seconds. Minimum value is 0.
- periodSeconds: How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
- timeoutSeconds: Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1.
- successThreshold: Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness. Minimum value is 1.
- failureThreshold: When a probe fails, Kubernetes will try failureThreshold times before giving up. Giving up in case of liveness probe means restarting the container. In case of readiness probe the Pod will be marked Unready. Defaults to 3. Minimum value is 1.

HTTP probes have additional fields that can be set on httpGet:
- host: Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.
- scheme: Scheme to use for connecting to the host (HTTP or HTTPS). Defaults to HTTP.
- path: Path to access on the HTTP server.
- httpHeaders: Custom headers to set in the request. HTTP allows repeated headers.
- port: Name or number of the port to access on the container. Number must be in the range 1 to 65535.

## Creating probes

All examples can be found in [Docs](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)

