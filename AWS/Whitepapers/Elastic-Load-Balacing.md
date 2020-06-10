# Aplication Load Balancer

Application Load Balancer operates at the request level (layer 7), routing traffic to targets – EC2 instances, containers, IP addresses and Lambda functions based on the content of the request. Ideal for advanced load balancing of HTTP and HTTPS traffic, Application Load Balancer provides advanced request routing targeted at delivery of modern application architectures, including microservices and container-based applications. Application Load Balancer simplifies and improves the security of your application, by ensuring that the latest SSL/TLS ciphers and protocols are used at all times.

## Key Features

**Layer-7 Load Balancing:** You can load balance HTTP/HTTPS applications and use layer 7-specific features, such as X-Forwarded-For headers.

**HTTPS Support:** An Application Load Balancer supports HTTPS termination between the clients and the load balancer. Application Load Balancers also offer management of SSL certificates through AWS Identity and Access Management (IAM) and AWS Certificate Manager for pre-defined security policies.

**Server Name Indication (SNI):** Server Name Indication (SNI) is an extension to the TLS protocol by which a client indicates the hostname to connect to at the start of the TLS handshake. The load balancer can present multiple certificates through the same secure listener, which enables it to support multiple secure websites using a single secure listener. Application Load Balancers also support a smart certificate selection algorithm with SNI. If the hostname indicated by a client matches multiple certificates, the load balancer determines the best certificate to use based on multiple factors including the capabilities of the client.

**IP addresses as Targets:** You can load balance any application hosted in AWS or on-premises using IP addresses of the application backends as targets. This allows load balancing to an application backend hosted on any IP address and any interface on an instance. Each application hosted on the same instance can have an associated security group and use the same port. You can also use IP addresses as targets to load balance applications hosted in on-premises locations (over a Direct Connect or VPN connection), peered VPCs and EC2-Classic (using ClassicLink). The ability to load balance across AWS and on-prem resources helps you migrate-to-cloud, burst-to-cloud or failover-to-cloud.

**Lambda functions as Targets:** support invoking Lambda functions to serve HTTP(S) requests enabling users to access serverless applications from any HTTP client, including web browsers. You can register Lambda functions as targets for a load balancer and leverage the support for content-based routing rules to route requests to different Lambda functions. You can use an Application Load Balancer as a common HTTP endpoint for applications that use servers and serverless computing.

**High Availability:** Load Balancer requires you to specify more than one Availability Zone. You can distribute incoming traffic across your targets in multiple Availability Zones. An Application Load Balancer automatically scales its request handling capacity in response to incoming application traffic.

**Security Features:** When using Amazon Virtual Private Cloud (VPC), you can create and manage security groups associated with Elastic Load Balancing to provide additional networking and security options. You can configure an Application Load Balancer to be Internet facing or create a load balancer without public IP addresses to serve as an internal.

**Content-based Routing:** If your application is composed of several individual services, an Application Load Balancer can route a request to a service based on the content of the request:
- Host-based Routing: You can route a client request based on the Host field of the HTTP header allowing you to route to multiple domains from the same load balancer.
- Path-based Routing: You can route a client request based on the URL path of the HTTP header.
- HTTP header-based routing: You can route a client request based on the value of any standard or custom HTTP header.
- HTTP method-based routing: You can route a client request based on any standard or custom HTTP method.
- Query string parameter-based routing: You can route a client request based on query string or query parameters.
- Source IP address CIDR-based routing: You can route a client request based on source IP address CIDR from where the request originates.

**Containerized Application Support:** provides enhanced container support by load balancing across multiple ports on a single Amazon EC2 instance. Deep integration with the Amazon EC2 Container Service (ECS), provides a fully-managed container offering. ECS allows you to specify a dynamic port in the ECS task definition, giving the container an unused port when it is scheduled on the EC2 instance. The ECS scheduler automatically adds the task to the load balancer using this port.

**HTTP/2 Support:** HTTP/2 is a new version of the HyperText Transfer Protocol (HTTP) that uses a single, multiplexed connection to allow multiple requests to be sent on the same connection. It also compresses header data before sending it out in binary format and supports SSL connections to clients.

**WebSockets Support:** WebSockets allows a server to exchange real-time messages with end-users without the end users having to request (or poll) the server for an update. The WebSockets protocol provides bi-directional communication channels between a client and a server over a long-running TCP connection.

**Native IPv6 Support:** Support native Internet Protocol version 6 (IPv6) in aVPC. This will allow clients to connect to the Application Load Balancer via IPv4 or IPv6.

**Sticky Sessions:** Sticky sessions are a mechanism to route requests from the same client to the same target. Application Load Balancer supports sticky sessions using load balancer generated cookies. If you enable sticky sessions, the same target receives the request and can use the cookie to recover the session context. Stickiness is defined at a target group level.

**Health Checks:** Application Load Balancer routes traffic only to healthy targets. With an Application Load Balancer, you get improved insight into the health of your applications in two ways: (1) health check improvements that allow you to configure detailed error codes from 200-499. The health checks allow you to monitor the health of each of your services behind the load balancer; and (2) new metrics that give insight into traffic for each of the services running on an EC2 instance.

**Operational Monitoring:** Amazon CloudWatch reports Application Load Balancer metrics such as request counts, error counts, error types, and request latency.

**Logging:** Access Logs feature to record all requests sent to your load balancer, and store the logs in Amazon S3 for later analysis. The logs are compressed and have a gzip file extension. The compressed logs save both storage space and transfer bandwidth and are useful for diagnosing application failures and analyzing web traffic. You can also use AWS CloudTrail to record Application Load Balancer API calls for your account and deliver log files.

**Delete Protection:** You can enable deletion protection on an Application Load Balancer to prevent it from being accidentally deleted.

**Request Tracing:** Application Load Balancer injects a new custom identifier “X-Amzn-Trace-Id” HTTP header on all requests coming into the load balancer. Request tracing allows you to track a request by its unique ID as the request makes its way across various services that make up the your websites and distributed applications. You can use the unique trace identifier to uncover any performance or timing issues in your application stack at the granularity of an individual request.

**Web Application Firewall:** You can now use AWS WAF to protect your web applications on your Application Load Balancers. AWS WAF is a web application firewall that helps protect your web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources.

**Slow Start Mode with Load-Balancing Algorithm:** supports a round-robin load-balancing algorithm. Additionally, Application Load Balancer supports a slow start mode with the round-robin algorithm that allows you to add new targets without overwhelming them with a flood of requests. With the slow start mode, targets warm up before accepting their fair share of requests based on a ramp-up period that you specify. Slow start is very useful for applications that depend on cache and need a warm-up period before being able to respond to requests with optimal performance.

**User Authentication:** You can offload the authentication functionality from your apps into Application Load Balancer. Application Load Balancer will securely authenticate users as they access cloud applications. Application Load Balancer is seamlessly integrated with Amazon Cognito, which allows end users to authenticate through social identity providers such as Google, Facebook, and Amazon, and through enterprise identity providers such as Microsoft Active Directory via SAML or any OpenID Connect-compliant identity provider (IdP). If you already have a custom IdP solution that is OpenID Connect-compatible, Application Load Balancer can also authenticate enterprise users by directly connecting with your identity provider.

**Redirects:** can redirect an incoming request from one URL to another URL. This includes the capability to redirect HTTP requests to HTTPS requests, which allows you to meet your compliance goal of secure browsing, while being able to achieve better search ranking and SSL/TLS score for your site. You can also use redirects to send users to a different web site; for example, redirecting from an old version of an application to a new version.

**Fixed response:** control which client requests are served by your applications. This enables you to respond to incoming requests with HTTP error response codes and custom error messages from the load balancer itself, without forwarding the request to the application.

# Network Load Balancer

Network Load Balancer operates at the connection level (Layer 4), routing connections to targets - Amazon EC2 instances, microservices, and containers – within Amazon Virtual Private Cloud (Amazon VPC) based on IP protocol data. Ideal for load balancing of both TCP and UDP traffic, Network Load Balancer is capable of handling millions of requests per second while maintaining ultra-low latencies. Network Load Balancer is optimized to handle sudden and volatile traffic patterns while using a single static IP address per Availability Zone. It is integrated with other popular AWS services such as Auto Scaling, Amazon EC2 Container Service (ECS), Amazon CloudFormation and AWS Certificate Manager (ACM).

## Key Features

**Connection-based Load Balancing:** You can load balance both TCP and UDP traffic, routing connections to targets - Amazon EC2 instances, microservices, and containers.

**High Availability:** Network Load Balancer is highly available. It accepts incoming traffic from clients and distributes this traffic across the targets within the same Availability Zone. The load balancer also monitors the health of its registered targets and ensures that it routes traffic only to healthy targets. When the load balancer detects an unhealthy target, it stops routing traffic to that target and reroutes traffic to remaining healthy targets. If all of your targets in one Availability Zone are unhealthy, and you have set up targets in another Availability Zone, Network Load Balancer will automatically fail-over to route traffic to your healthy targets in the other Availability Zones.

**High Throughput:** Network Load Balancer is designed to handle traffic as it grows and can load balance millions of requests/sec. It can also handle sudden volatile traffic patterns.

**Low Latency:** Network Load Balancer offers extremely low latencies for latency-sensitive applications.

**Preserve source IP address:** Network Load Balancer preserves the client side source IP allowing the back-end to see the IP address of the client. This can then be used by applications for further processing.

**Static IP support:** Network Load Balancer automatically provides a static IP per Availability Zone (subnet) that can be used by applications as the front-end IP of the load balancer.

**Elastic IP support:** Network Load Balancer also allows you the option to assign an Elastic IP per Availability Zone (subnet) thereby providing your own fixed IP.

**TLS Offloading:** Network Load Balancer supports client TLS session termination. This enables you to offload TLS termination tasks to the load balancer, while preserving the source IP address for your back-end applications. You can choose from predefined security policies for your TLS listeners in order to meet compliance and security standards. AWS Certificate Manager (ACM) or AWS Identity and Access Management (IAM) can be used to manage your server certificates. 

**Health Checks:** supports both network and application target health checks. Network-level health is based on the overall response of your target to normal traffic. If the target becomes unable, or too slow, to respond to new connections then the load balancer will mark the target as unavailable. Application-level health checks can also be used to go deeper.

**DNS Fail-over:** If there are no healthy targets registered with the Network Load Balancer or if the Network Load Balancer nodes in a given zone are unhealthy, then Amazon Route 53 will direct traffic to load balancer nodes in other Availability Zones.

**Integration with Amazon Route 53:** In the event that your Network Load Balancer is unresponsive, integration with Route 53 will remove the unavailable load balancer IP address from service and direct traffic to an alternate Network Load Balancer in another region.

**Integration with AWS Services:** Network Load Balancer is integrated with other AWS services such as Auto Scaling, Elastic Container Service (ECS), CloudFormation, Elastic BeanStalk, CloudWatch, Config, CloudTrail, CodeDeploy, and AWS Certificate Manager (ACM).

**Long-lived TCP Connections:** Network Load Balancer supports long-lived TCP connections that are ideal for WebSocket type of applications.

**Central API Support:** uses the same API as Application Load Balancer. This will enable you to work with target groups, health checks, and load balance across multiple ports on the same Amazon EC2 instance to support containerized applications.

**Robust Monitoring and Auditing:** Amazon CloudWatch reports Network Load Balancer metrics. CloudWatch provides metrics such as Active Flow count, Healthy Host Count, New Flow Count, Processed bytes, and more. Network Load Balancer is also integrated with AWS CloudTrail. CloudTrail tracks API calls to the Network Load Balancer.

**Enhanced Logging:** You can use the Flow Logs feature to record all requests sent to your load balancer. Flow Logs capture information about the IP traffic going to and from network interfaces in your VPC. Flow log data is stored using Amazon CloudWatch Logs.
When TLS listeners are added to your Network Load Balancer, you can choose to enable Access Logs, which will be sent to an S3 bucket of your choice. Access Logs capture information about every TLS connection that your listener receives, providing visibility into both successful and failed TLS handshakes.

**Zonal Isolation:** The Network Load Balancer is designed for application architectures in a single zone. If something in the Availability Zone fails, we will automatically fail-over to other healthy Availability Zones. While we recommend customers configure the load balancer and targets in multiple AZs for achieving high availability, Network Load Balancer can be enabled in a single Availability Zone to support architectures that require zonal isolation.

**Sticky Sessions:** Sticky sessions (source IP affinity) are a mechanism to route requests from the same client to the same target. Stickiness is defined at the target group level.