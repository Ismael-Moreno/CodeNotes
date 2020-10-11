# Amazon VPC definition
Amazon Virtual Private Cloud (VPC) enables you to launch Amazon Web Services resources into a virtual network that you have defined. This virtual network closely resembles a traditional network that you would operate in your own datacenter, with the benefits of using the scalable infraestructure of AWS.

A VPC is your own virtual network in the Amazon cloud which is used as the network layer for your EC2 resources.

![vpc-diagram](./images/vpc-diagram.png)

# Default AWS VPC
Each amazon account comes with a default VPC that is preconfigured for you to start straight away. You can launch your EC2 instances without having to think about anything. A VPC can span multiple AZ in a region.

![default-vpc](./images/default-vpc.png)

# Custom VPC
Default VPC its great for launching new instances when you are testing, but creating a custom VPC allows you to make things more secure. You can customize your virtual network as you can define your own IP address range, you can create your own subnets that are both public and private and set new security settings.

# Hardware VPN Access
By default the instances that you launch into a VPC can't communicate with your own network. You can connect your VPC to your existing data center using Hardware VPN access, effectively extending your data center into the cloud and create a hybrid environment. To do this you need a Virtual Private Gateway and this is the VPN concentrator on the Amazon side of the VPN connection. Then in your datacenter side you need a customer gateway which is either a physical device or a software application.

# VPC peering
A peering connection can be made between your own VPCs or with a VPC in another AWS account as long as it is in the same region. Peering is a one to one relationship and a VPC can have multiple peering connections but transitive peering is not supported. VPCs with overlapping CIDRs (same IP ranges) cannot be paired. Thats to say B can connect with A but not with C. C can connect with A but not with B and A can connect with B and C.

![peering-vpc](./images/vpc-peering.png)

If you delete the default VPC you have to contact AWS support to get it back again.

# Elastic IP address
This allows your instance to retain its public IP address. Elastic IP address is a static or persistent public IP address that is allocated to your account and can be associated to your instances as required. It remains in your account until you chose to release it. There is a charge associated with an elastic IP address if it is in your account but not actually associated to an instance.

# Subnet definition
A range of IP addresses in your VPC. You can launch AWS resources into a subnet that you select. Use a public subnet for resources that must be connected to the internet and a private subnet for resources that won't be connected to the internet.

The subnet is always mapped to a single AZ and you will not be able to launch any instance if you don't have subnets in you VPC. There is two types of subnet:
- Public: Resources connected to the internet (Web servers) It is public beacuse its main route table sends to subnets traffic that is destined for the internet to the internet gateway.
- Private: Resources that don't need an internet connection or that you want to protect from the internet (Databases).

# Internet Gateway definition
Its a horizontally scaled, redundant and highly available VPC component that allows communication between instances in your VPC and the internet. It therefore imposes no availability risks or bandwith constraints on your network traffic.
