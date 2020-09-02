## Definition

Amazon Elastic Kubernetes Service (Amazon EKS) is a fully managed Kubernetes service. EKS is deeply integrated with services such as Amazon CloudWatch, Auto Scaling Groups, AWS Identity and Access Management (IAM), and Amazon Virtual Private Cloud (VPC), providing you a seamless experience to monitor, scale, and load-balance your applications.

Amazon EKS automatically manages the availability and scalability of the Kubernetes control plane nodes that are responsible for starting and stopping containers, scheduling containers on virtual machines, storing cluster data, and other tasks. Amazon EKS automatically detects and replaces unhealthy control plane nodes for each cluster.

With Amazon EKS, you can take advantage of all the performance, scale, reliability, and availability of the AWS platform, as well as integrations with AWS networking and security services, such as Application Load Balancers for load distribution, Identity Access Manager (IAM) for role based access control, and Virtual Private Cloud (VPC) for pod networking.

eksctl is an open source command line tool that gets you up and running with Amazon EKS in minutes. Executing eksctl create cluster, will create an Amazon EKS cluster ready to run your application in minutes. It creates master and workers stacks using Cloud formation.
## Create Cluster

`eksctl create cluster --name test-cluster --version 1.17 --without-nodegroup --region us-east-1 --zones us-east-1b, us-east-1a`  
`aws eks --region us-east-1 update-kubeconfig --name test-cluster`  
`kubectl cluster-info`  

## Create worker nodes
```
eksctl create nodegroup \
--cluster test-cluster \
--version auto \
--name standard-workers \
--node-type t3.medium \
--node-ami auto \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \ 
--asg-access
```

## Ingress Controller

The AWS ALB Ingress Controller for Kubernetes is a controller that triggers the creation of an Application Load Balancer (ALB) and the necessary supporting AWS resources whenever an Ingress resource is created on the cluster with the kubernetes.io/ingress.class: alb annotation. The Ingress resource configures the ALB to route HTTP or HTTPS traffic to different pods within the cluster. The ALB Ingress Controller is supported for production workloads running on Amazon EKS clusters.

```
annotations:
    kubernetes.io/ingress.class: alb
```

The ALB Ingress controller supports the following traffic modes:
- Instance – Registers nodes within your cluster as targets for the ALB. Traffic reaching the ALB is routed to NodePort for your service and then proxied to your pods. This is the default traffic mode. You can also explicitly specify it with the alb.ingress.kubernetes.io/target-type: instance annotation.

- IP – Registers pods as targets for the ALB. Traffic reaching the ALB is directly routed to pods for your service. You must specify the alb.ingress.kubernetes.io/target-type: ip annotation to use this traffic mode.

### Requisites

Tag the subnets in your VPC that you want to use for your load balancers so that the ALB Ingress Controller knows that it can use them. For more information, see Subnet tagging requirement. If you deployed your cluster with eksctl, then the tags are already applied:  

- All subnets in your VPC should be tagged accordingly so that Kubernetes can discover them.  
  `kubernetes.io/cluster/<cluster-name>  shared`  
- Public subnets in your VPC should be tagged accordingly so that Kubernetes knows to use only those subnets for external load balancers.  
  `kubernetes.io/role/elb  1`  
- Private subnets must be tagged in the following way so that Kubernetes knows it can use the subnets for internal load balancers. If you use an Amazon EKS AWS CloudFormation template to create your VPC after 03/26/2020, then the subnets created by the template are tagged when they're created.  
  `kubernetes.io/role/internal-elb 1`  

Create an IAM OIDC provider and associate it with your cluster. If you don't have eksctl version 0.26.0 or later installed, complete the instructions in Installing or upgrading eksctl to install or upgrade it. You can check your installed version with eksctl version.
```
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster test-cluster \
    --approve
```

Download an IAM policy for the ALB Ingress Controller pod that allows it to make calls to AWS APIs on your behalf.  
`curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/iam-policy.json`  
Create an IAM policy called ALBIngressControllerIAMPolicy using the policy downloaded in the previous step.  
```
aws iam create-policy \
    --policy-name ALBIngressControllerIAMPolicy \
    --policy-document file://iam-policy.json
```

Create a Kubernetes service account named alb-ingress-controller in the kube-system namespace, a cluster role, and a cluster role binding for the ALB Ingress Controller to use with the following command.  
`kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/rbac-role.yaml`  

Create an IAM role for the ALB Ingress Controller and attach the role to the service account created in the previous step.  
```
eksctl create iamserviceaccount \
    --region us-east-1 \
    --name alb-ingress-controller \
    --namespace kube-system \
    --cluster test-cluster \
    --attach-policy-arn arn_code \
    --override-existing-serviceaccounts \
    --approve
```

### Deploy ALB (ingress controller)

Deploy the ALB Ingress Controller with the following command.  
`kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/alb-ingress-controller.yaml`  

Open the ALB Ingress Controller deployment manifest for editing with the following command.  
`kubectl edit deployment.apps/alb-ingress-controller -n kube-system`  

Add a line for the cluster name after the --ingress-class=alb line. If you're running the ALB Ingress Controller on Fargate, then you must also add the lines for the VPC ID, and AWS Region name of your cluster. Once you've added the appropriate lines, save and close the file.  
```
    spec:
      containers:
      - args:
        - --ingress-class=alb
        - --cluster-name=cluster-test
```

Confirm that the ALB Ingress Controller is running with the following command.  
`kubectl get pods -n kube-system`  
```
Expected output:

NAME                                      READY   STATUS    RESTARTS   AGE
alb-ingress-controller-55b5bbcb5b-bc8q9   1/1     Running   0          56s
```

### Deploy a sample application

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/2048/2048-namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/2048/2048-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/2048/2048-service.yaml
```
To check the application running forwarding the port to our local machine:  
`kubectl port-forward pod-name -n 2048-game 7000:80`  

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/2048/2048-ingress.yaml`  

`kubectl edit ingress 2048-ingress -n 2048-game`  

```
spec:
  rules:
    - host: app.mydomain.com
      http:
        paths:
          - path: /*
            backend:
              serviceName: service-2048
              servicePort: 80
```

`kubectl logs -f -n kube-system <pod-name>`  
