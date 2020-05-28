# Cloud concepts

## What is Cloud Computing

The practice of using a network of remote servers hosted on the internet to store, mange and process data, rather than a local server or personal computer.

## On Premise vs Cloud Providers

On-Premise:

- You own the servers
- You hire the IT people
- You pay or rent the real-state
- You take all the risk

Could Providers:

- Someone else own the servers
- Someone else hires the IT people
- Someone else pays or rents the real state
- You are responsible for your configuring cloud services and code, someone else take care of the rest

## Six advantages and benefits

- Trade capital expense for variable expense. No upfront-cost istead of paying for data centers and servers Pay On-Demand only when you consume computing resources.
- Benefit from massive economies of scale. Usage from gunftrdfd of thousand of customers aggregated in the cloud. You are sharing the cost with other customers to get unbeatable savings.
- Stop guessing capacity. Eliminate guesswork about infraestructure capacity needs. Instead of paying for iddle or underutilized servers, you can scale up or down to meet the current need.
- Increase speed and agility. Launch resources within a few clicks in minutes istead of waiting days or weeks of your IT to implement the solution on-premise.
- Stop spending money on running and maintaining data centers. Focus on your own customers, rather than in the heavy lifting of racking, stacking, and powering servers.
- Go global in minutes. Deploy your app in multiple regions arround the world in a few clicks. Provide lower latency and a better experience for your customers at minimal cost.

## Types of Cloud Computing

- SaaS (For Customers) Software as a service. A completed product that is run and manged by the service provider.
- PaaS (For Developers) Platform as a service. Removes the need for your organization to manage the underlying infraestructure. Focus on the deployment and management of your applications.
- IaaS (For Amins) Infraestructure as a service. The basic building blocks for cloud IT. Provides access to networking features, computers and data storage space.

## Cloud Computing Deployment Models

- Cloud. Fully utilizing cloud computing. Designed for startups, SaaS offerings, new proyects and companies.
- Hybrid. Using both Cloud and on premise. For banks, fintech, Ivest management, large professional Service providers, legacy On-Pemise.
- On-Premise. Deploying resources on-premise, using virtualization and resource management tools, is sometimes called private cloud. Public sector, super sensitive data, large enterprise with heavy regulation.

# AWS Global Infraestructure

69 Avilability Zones within 22 Geographic Regions arround the world. Way More Edge Locations than AZs.

AWS server over a million active customers in more than 190 countries. Steadily global infreastructure to help customers achieve lower latency and higher throughput.

Regions are a physical location in the world with multiple Availability Zones.

Availability Zones are one or more discrete data centers.

Edge locations are datacenters owned by a trusted partner of AWS.

## Regions

A geographically distinct location wich has multiple dastacenters (AZs). Every region is independent of every other region in termns of location, power, water supply. Easch region has at least two AZs and the largest region is US-EAST.

New services almost always become available fist in US-EAST. Not all services are available in all regions. US-EAST-1 is the resion where you see all your billing infotmation.

## Availability Zones

An AZ is a datacenter owned and operated by AWS in which AWS services run. Each region has at least two AZs. AZs are represented by a region code, followed by a letter identifier.

Multi-AZ: Distributing your instances across multiple AZs allows failover configuration for handling requests when one goes down (<10ms latency between AZs)

## Edge Locations

An Edege Location is a datacenter owned by a trusted partner of AWS which has a direct connection to AWS network. These locations server requests for CloudFront and route53. Requests going to either of these service will be routed to the nearest edge location automatically.

S3 Transfer Acceleration traffic and API Gateway endpoint traffic also use the AWS Edge Network. This allows for low latency no matter where the end user is geographically located.

## GovCloud Regions

AWS GovCloud Regions alllow customers to host sensitive Controlled Unclasssified Information and other types of regulated workloads. GovCloud Regiond are only operated by employees who are U.S. citizens, on U.S. soil. They are only accesible to U.S. entities and root account holders who pass a screening process. Cuatomers can architect secure solutions that comply with:

- FedRAMP High Baseline
- DOJ`s Criminal Justice Information Systems (CJIS) Security Policy
- U.S. International Traffic in Arms Regulations (ITAR)
- Export Administrtion Regulations (EAR)
- Department of Defense (DoD) Cloud Computing Security Requeriments Guide

# EC2 Pricing Models

![Pricing schema](./pricing.png)

## On-Demand

When you launch an EC2 instance it is by default using On-demand pricing. On-demand has no up-front payment and no long term commitment. You are charged by the hour or by the minute (varies based on EC2 instace types)

On-demand is for applications where the workloads is for short-term, spikey or unpredictible. When you have a new app for development or you want to run experiment.

## Reserved Instances

Designed for applications that have a steady-state, predictable usage, or requie reserved capacity. RIs can be shared between multiple accounts within an org. Unused RIs can be sold in the Reserved Instance Marketplace.

> Reduced pricing is based on Term x Class Offering x Payment Option.

### Class

- Standard: Up to 75% reduced pricing compared to on-demand. Cannot change RI attributes.
- Convertible: Up to 54% reduced pricing compared to on demand. Allows you to change RI attributes if greater or equal in value.
- Scheduled: You reserve instances for specific time periods. Savings vary.

### Terms

You commit to a 1 year or 3 year contract. The longer the term the greater savings.

### Payment options

All upfront, Partial Upfront and No Upfront. The greater upfront the great the savings.

## Spot Instances

AWS has unused capacity that they want to maximize the utility of their iddle servers. Spot instances provide a discount of 90% compared to On-demand pricing. Spot Instances can be terminated if the computing capacity is needed by on-demand customers.

### Termination conditions

Instances can be terminated by AWS at anytime. If your instance is terminated by AWS, you do not get charged for a partial hour of usage. If you terminate an instance you will still be charged for any hour that it ran.

## Dedicated Host Intances

Designed to meet regulatory requirements. When you have strict server-bound licensing that will not support multi-tenancy or cloud deployments.

> Multi-Tenant: When multiple customers are running workloads on the same hardware (Virtual Isolation). Single-Tenant: When a single customer has dedicated harware (Physical Isolation)

Offered in both On-Demand and Reserved (70% on-demand pricing). Enterprise and Large Organizations may have security concerns or obligations about against sharing the same hardware with other AWS customers.

# Billing and Pricing

## Free Services

Totally Free: IAM - Identity Access Management, Amazon VPC, Organizations and Consolidated Billing
Can incur on costs: Auto Scaling, CloudFormation, Elastic Beanstalk, Opsworks, Amplify, AppSync, CodeStar

## AWS Support Plans

![Support Plans](./support_plans.png)

## AWS Marketplace

AWS Marketplace is acurated digital catalogue with thousands og software listings from independent software vendors. Easily find, buy, test and deploy software that already runs on AWS.

The product can be free to use or can have an associated charge. The charge becomes part of your AWS bill, and once you pay, AWS MArketplace pays the provider.

The sales channel for ISVs and Consulting Partners allows you to sell your solutions to other AWS customers.

Products can be offered as:

- Amazon Machine Images (AAMIs)
- AWS CloudFormation templates
- Software as a service (SaaS) offerings
- Web ACL
- AWS WAF rules

## AWS Trusted Advisor

Advises you in security, saving money, performance, service limits and fault tolerance. (best practices on AWS). It is divided in several categories:

![Trusted Advisor](./trust_advisor1.png)
![Trusted Advisor](./trust_advisor2.png)

## Consolidated Billing

One bill for all your accounts. Consolidate your billing and payment methods across multiple AWS accounts into one bill.  
For billing AWS treats all the accounts in an organization as if they were one account. You can designate one master account that pays the charges of all the other member accounts.

Consolidated billing is offered at no additional cost! Use Cost Explorer to visualize usage for consolidated billing.

## Consolidated Billing Volume Discoints

AWS has Volume Discounts for many services. The more you use, the more you save. Consolidated Billing lets you take advantage of Valume Discounts. (First 10 TB = 0.17 / Next 40 TB = 0.13)

## AWS Cost Explorer

AWS Const Explorer lets you visualize, understand and manage your AWS costs and usage over time. If you have multiple AWS accounts within an AWS organisation costs will be consolidated in the master account. Default reports help you gain insight into cost drivers and usage trends. Use forecasting to get an idea of future costs.

## AWS Budgets

First two budgets are free of charge. Each budget is \$0.02 per day ~0.60 USD/month, 20.000 budgets limit.
Plan your service usage, service costs and Instance reservations. budgets give you the ability to setup alerts if you exceed or are approaching your defined budget.

Create Cost, Usage or Reservation Budgets. Can be tracked at the monthly, quarterly, or yearly levels, with customizable start and end dates. Alerts support EC2, RDS, Redshift and ElastiCache reservations.

Budget based on a fixed cost or plan your upfrony based on your chosen level. Can be easily manage from the AWS Budgets dashboard or via the Budgets API. Get Notified by providing an email or Chatbot and threshold how close to the current or forecasted budget.

## TCO Calculator

The Toal Cost of Ownership allows you to estimate how much you would save when moving to AWS from on-premise. Provides you s detailed set of reports that can be used in executive presentations.

The tool is built on underlying calculation models that generate fair assessments of value that you can achieve given the data provided. This TCO helps by reducing the need to invest in large capital expenditures. The tool is for approximation purposes only.

## AWS Landing Zone

Helps ENterprises quickly set-up a secure, AWS multi-account. Provides you with a baseline environment to get started with a multi-account architecture.

AWS Account Vending Machine (AVM): Automatically provisions and confgure new accounts via Service Catalog Template. Uses Sungle Sign-on (SSO) for managing and accessing accounts.

The environment is customizable to allow customers to implement their own account baseline through a Landing Zone configuration and upate pipeline.

## Resource Groups and Tagging

Tags are words or phrases that act as metadata for organizing your AWS resources. Resrouce Groups are a collection of resources that share one or more tags.

Helps you organize and consolidate information based on your project and the resources that you use. Resource groups can display details about a group of resource based on Metrics, Alarms and Configuration Settings. At any time you can modify the settingd of your resource groups to change what resources appear.

## AWS QuickStart

Prebuilt templates by AWS and AWS Partners to help you deploy popular stacks on AWS. Reduce hundreds of manual procedures into just a few steps. A quick Start is composed by 3 parts:

- A reference architecture for the deployment.
- AWS CloudFormation templates that automate and configure the deployment.
- A deployment guide explaining the architecture and implementation in detail.

Most Quick Start reference deployments enable you to spin up a fully functinal architectire in less than an hour!

## AWS Cost and Usage Report

Generate a detailed spreadsheet, enabling you to better analyze and understand your AWS costs. It places the report into S3.

You can use Anthena to turn the report into a queryable database ans use QuickSight to visualize your billing as graphs.

# Technology Overview

## AWS Organizations and Accounts

Organizations allow you to centrally manage billing, control access, compliance, securit, and share resources across your AWS accounts.

Root Account User is a single sign-in identity that has complete access to all AWS services and resources in an account. Each account has a Root Account User.

Organization Units are a group of AWS accounts within an organization which can also contain other organizational units - creating a hierarchy.

Service Control Policies give central control over the allowed permissions for all accounts in your organization, helping to ensure your accountd stay within your organization, helping ti ensure your accounts stay eithin your organizations guidelines.

## AWS Networking

- Region: the geographical location of your network.
- AZ: the data of your AWS resources.
- VPC: A logically isolated section if the AWS Cloud where you can launch AWS resources
- Internet Gateway: Enable access to the Internet
- Route tables: Determine where network traffic from your subnets are directed
- NACLs: Acts as a firewalls at the subnet level
- Security Groups: Acts as firewalls at the instance level
- Subnets: A logical partition of an IP network into multiple, smaller network segments

![Networking](./networking.png)

## Database Services

- DynamoDB: NoSQL key/value database
- DocumentDB - NoSQL Document database that is MongoDB compatible.
- RDS: Relational Database Service that supports multiple engines (MySQL, Postgres, Maria DB, Oracle, Microsoft SQL Server, Aurora)
  - Aurora: MySQL (5x faster) and PSQL (3x faster) database fully managed
  - Aurora Serverless: Only runs when you need it, like AWS Lambda
- Neptune: Managed Graph Database
- Redshift: Clumnar fatabase, petabyte warehouse
- ElastiCache: Redis or Memcached database

## Provisioning Services

Provisioning is the alllocation or creation of resources and services to a customer.

- Elastic Beanstalk: Service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Ruby, Go and Docker
- OpsWork: Configuration management service that provides managed instances of Chef and Puppet
  CloudFormation: Infraestructure as code JSON or YAML
- AWS QuickStart: Pre made packages that can laynch and configure your AWS compute, network, storege and other services required to deploy a workload on AWS
- AWS Marketplace: A digital catalogue of thousands of software listings from independent software

## Computing Services

- EC2: Elastic Compute Cloud, highly configurable server.
- ECS Elastic Container Service, Docker as a Service highly scalable, high perfornabce container orchestration service that supports Docker containers, pay for EC2 instances
- Fargate: Microservices where you do not think about the infraestructure. Pay per task.
- EKS: Kubernetes as a Service eassy ti deploy, manage and scale containerized applications using Kubernettes
- Lambda: Serverless functions run code without provinioning or managing servers. You pay only for the compute time you consume
- Elastic Beanstalk: Orchestrates various AWS services, including EC2, S3, Simple Notification Service (SNS), CloudWatch, autoscaling and Elastic Load Balances
- AWS Batch plans, schedules and executes your batch computing woekloads accrpss the full range of AWS vompute sevices and features, such as Amazon EC2 and Spot Instances

## Storage Services

- S3: Simple Storage Service, object storage
- S3 Galcier: Low cost stoarege fot archiving and long-term backup
- Storage Gateway: Hybrid cloud storage with local caching (File Gateway, Volume Gateway, Tape Gateway)
- EBS: Elastic Blok Storage, hard drive in the cloud you attach to EC2 indtances (SSD, IOPS SSD, Throughput HHD, Cold HHD)
- EFS: Elastic File Storage, file storage mountable to multiple EC2 instances at the same time
- Snowball: Physically migrate lots of data via a computer suitvase 50-80 TB
  - Snowball Edge: A better version of Snowball 100 TB
  - Snowmobile: Shipping container, pulled by a semi trailer truck 100 PB

## Business Centric Services

- Amazon Connect: Call Center, Cloud Based call cebter service you can setup in just a few clisckd. Based on the same proven system used by the Amazon customer services teams.
- WokSpaces: Virtual Remote Desktop, Secure managed service for provisioning either Windows or Linux desktops in hyst a few minutes ehivh quickly scales up to thousands of desktops.
- WorkDocs: A content creation and collaboration service easily create, edit and share contet saves centrally in AWS (AWS version of Sharepoint).
- Chime: AWS Platform for online meetings, video conferencing and business calling which elastically scales to meet your capacity needs.
- WorkMail: Managed business email, contacts and calendar service with support fot existing desktop and mobile email client applications (IMAP).
- Pinpoint: Marketing campaign management system you can use for sending targeted email, SNS, push notifications and voice messages.
- SES (Simple Email Service): A cloud based email sending service designed for marketers and application developers to send marketing, notification and emails.
- QuickSight: A Business Intelligence (BI) service. Connect multiple datasource and quickly visualize data in the form if graphs with little to no programming knowledge.

## Enterprise Integration

- Direct Connect: Dedicated Gigabit network connection from your premises to AWS. Imagine having a direct fibre optic running straight to AWS.
- VPN: Establish a secure connection to your AWS network.
  - Site-to-Site: Connecting your on-premise to your AWS network
  - Client VPN: Connecting a Client to your AWS network
- Storeage Gateway: A hybrid storage sevice that enables your on-premise applications to use AWS cloud storeage. You can use this for backup and archiving, disaster recovery, cloud data processing, storage tiering and migration.
- Active Directory: The AWS Directory Service for Microsogt Active Directory also known as AWS Managed Microsoft AD. Enables your directory-aware workloads and AWS resources to use managed Active Directory in the AWS Cloud.

## Logging Services

- Cloud Trail: Logs all API calls (SDK, CLI) between AWS services (who can we blame). Detect developer misconfiguration, malicious actors or automate responses.
- CloudWatch: Is a collection of multiple services.
  - CouldWatch Logs: Performance data about AWS Services (CPU, Memory, Network On Application Logs, Lanbda Logs...)
  - CloudWatch Metrics: Represents a time ordered set of data points. A variable to monitor.
  - CloudWatch Events: Trigger an even based on a condition
  - CloudWatch Alarms: Triggers notifications based on metrics
  - CloudWatch Dashboard: Create visualizations based in metrics

## Initialism

- IAM: Identity and Accesss Management
- S3: Simplre Storage Service
- SWF: Simple Workflow Service
- SNS: Simple Notification Service
- SQS: Simple Queue Service
- SES: Simple Email Service
- SSM: Simple Systems Manager
- RDS: Relational Database Service
- VPC: Virtual Private Cloud
- VPN: Virtual Private Network
- CFN: CloudFormation
- WAF: Web Applications Firewall
- MQ: Amazon ActiveMQ
- ASG: Auto Scaling Group
- TAM: Technical Account Manager
- ELB: Elastic Load Balancer
- ALB: Application Load Balancer
- NLB: Network Load Balancer
- EC2: Elastic Cloud Comnpute
- ECS: Elastic Container Service
- ECR: Elastic Container Repository
- EBS: Elastic Block Storage
- EFS: Elastic File Storage
- EMR: Elastic MapReduce
- EB: Elastic Beanstalk
- ES: Elasticsearch
- EKS: Elastic Kubernetes Service
- MKS: Managed Kafka Service
- IoT: Internet of Things
- RI: Reserved Instaces

# Security

## Shared Responsability Model

Customers are responsible for Security in the Cloud. AWS is responsible for Security of the Cloud.
![Responsability](./resp_model.jpg)

## AWS Compliance Programs

Compliance Programs: A set of internal policies and procedures of a company to comply with laws, rules and regulations or to uphold business reputation.

## AWS Artifact

How do we probe AWS meets a compliance?  
No cost, self-service portal for on-demand access to AWS compliance reports. On-demand access to AWS security and compliance reports and select online agreements. These checks are based on global compliance frameworks.

## Amazon Inspector

How do we prove an EC2 Instance is harden?  
Hardening is the act of eliminating as many security risks as possible. AWS Inspector runs a security benchmark against specific EC2 instances.

You can run a variety of security benchmarks. Can perform both Network and Host Assessments:

- Install the AWS agent on your EC2 instances
- Run an assessment for your assessment target
- Review your findings and remediate security issues

## AWS WAF

AWS Web Application Firewall protect your web applications from common web exploits. Write your own rules to ALLOW or DENY traffic based on the contents of an HTTP requests. use a ruleset from a trsted AWS Security Partner in AWS WAF Rules Marketplace. WAF can be attached to either CloudFront or an Application Load Balancer.

Protect web applications from attacks covered in the OWASP Top 10 most dangerous attacks:

1. Injection
2. Broken Authentication
3. Sensitive data exposure
4. XML External Entities (XXE)
5. Broken Access control
6. Security misconfigurations
7. Cross Site Scripting (XSS)
8. insecure Deserialization
9. Using Components with known vulnerabilities
10. Insuficient logging and monitoring

## AWS Shield

AWS Shield is a managed DDoS (Distributed Denial of Service) protection service that safeguards applications running on AWS.  
All AWS customers benefit from the automatic protectiond of AWS Shield Standard at no additional charge. When you rute your traffic throug Route53 or CloudFront you are using AWS Shield Standard. Protects you against Layer 3 (network), 4 (Transport) and 7 (Application).

- Shield Standard (Free): For protection against most common DDoS attacks and access to tools and best practices to build a DDoS resilient architecture. Automatically available on all AWS services.
- Shield Advanced (3000 USD / Year): For addtiional protection against larger and more sophisticated attacks, visibility into attacks and 24x7 access to DDoS experts for complex cases. Available on Route53, CloudFront, Elastic Load Bakancing, AWS Global Accelerator, Elastic IP (Amazon Elastic Compute Cloud and Network Load Balancer)

## Penetration Testing

Pentesting is an authorized somulated cyberattack on a computer system, performed to evaluate the security if the system. Can you perform Pentesting on AWS?:

- Permitted Services:
  - EC2 isntances, NAT GAteways and ELB
  - RDS
  - CloudFront
  - Aurora
  - API Gateways
  - AWS Lambda and Lanbda@Edge functions
  - Lightsail resources
  - Elastic Beanstalk environments
- Prohibited Activities:
  - DNS zone walking via Amazon Route 53 Hosted Zones
  - Denial of Service (DoS), Distributed Denial of Service (DDoS), Simulated DoS, Simulated DDoS
  - Port flooding
  - Protocol flooding
  - Request flooding (login request flooding, API request flooding)

For Other Simulated Events you will need to submit a request to AWS. A reply could take up to 7 days.

## GuardDuty

IDS/IPS (Intrusion Detection System and Intrusion Protection System) is a device os software application that monitors a network or systems for malicious activity or policy violations.

GuardDuty is a threat detection service that contiuously moniors for malicious, suspicious activity and unauthorized behavior. It uses Machine Learning to analyze the following AWS logs:

- CloudTrail Logs
- VPC Flow Logs
- DNS logs
  It will alert you of Findings which you can automate a incident response via CloudWatch Events or with third party Services.

## Key Management Service (KMS)

A managed service that makes it easy fot you to create and control the encryption keys used to encrypt your data:

- KMS is a multi-tenant HSM (hardware security module)
- Many AWS services are integratedto use KMS to encrypt your data with a simple checkbox
- KMS uses Envelope Encryption: When you encrypt your data, your data is protected, but you have to protect your ecryption key. You encrypt your data key with a master key as an additional layer of security.
  ![KMS](./KMS.png)

## Amazon Macie

Macie is a fully managed service that continuously monitors S3 data access activity for anomalies and generates detailed alerts when it detects risk of unauthorized access or inadvertent data leaks. Macie works by uses Machine Learning to Analyze your CloudTrail logs.

Macie has a variety of alerts:

- Anonymized Access
- Config Compliance
- Credential Loss
- Data Compliance
- File Hosting
- Identity Enumeration
- Information Loss
- Location Anomaly
- Open Permissions
- Privilege Escalation
- Ransomware
- Service Disruption
- Suspicious Access

Macie will identify your most at-risk users which could lead to a compromise.

## Security Groups vs NACLs

- Security Groups: Acts as a firewall at the instance level. Implicily denies all traffic. You create Allow rules. ( allow access on an EC2 on port 22)
- NACLs: Acts as a firewall at the subnet level. You create Allow and Deny rules. (block specific IP)

## AWS VPN

Lets you establish a secure and pricate tunnel from your network or device to the AWS global network.

- AWS Site-to-Site VPN: Securely connect on-premises network or branch office site to VPC
- AWS Client VPN: Securely connect users to AWS or on-premises networks.

# Variation Study

## Cloud Service

Similar names, completely different services:

- CloudFormation: Infrestructire as code, set up services via templating script (yml,json)
- CloudTrail: Logs all api call between AWS services
- CloudFront: Content Distribution Network. it create a caches copy of your website and copies to severs located near people trying download website
- CloudWatch: Is a collection of multiple services (Logs, Metrics, Events, Alarms, Dashboard)
- CloudSearch: Search engine, you have an ecommerce webdite and you want to add a search bar

## Connect Service

- Direct Connect: Dedicated Fiber Optics Connections from DaraCenter to AWS. A large enterprise has their own datacenter and they need an insalnely fast connection directly AWS. Of you need to security you can apply a VPN connect on-top pf Direct Connect.
- Amazon Connect: Call Center Service. Get a toll free number, accpet inbound and outbound calls, setup autonated phone systems.
- Media Connect: New Version of Elastic Transcoder, converts videos to different video types.

## Elastic Transcoder vs Media Connect

Both services transcode videos:

- Elastic transcoder: The old way. Transcodes videos to streaming formats.
- AWS Elemental MediaConvert: The new way. Transcodes videos to straming formats, overlays images, insert video clips, extracts captions data, robust UI.

## SNS vs SQS

They Both Connect Apps via Messages

- Simple Notifications Service: Pass Alongs Messages  
  Send notifications to Subscribers of topics via multiple protocol (HTTP, email, SQS, SMS). SNS is generally used for sending plain text emails which is triggered via other AWS Services. The best example of this is billing alarms. Can retry sending in case of failure for HTTPS. Really good for webhooks, simple internal email, triggering lamda functions. (PubNub)

- Simple Queue Service: Queue up Messages, Guarateed Delivery
  Places messages into a queue. Applications pull queue using AWS SDK. Can retain a message for up to 14 days, can send them in sequential order or in parallel, can ensure only one messsage is sent, can ensure messages are delivered at least once. Really good for delayed tasks, queuing up emails. (RabbitMQ)

## Inspector vs Trusted Advisor

Both are security tools and they both perform audits.

- Amazon Inspector: Audits a single EC2 Instance that you have selected. Generates a report from a long list of security checks.

- Trusted Advisor: Trusted Advisor do not generate out a PDF report. Gives you a holistic view of recommendations across multiple services and best preactices. You should enable MFA on your root account when using trusted advisor.

## ALB vs NLB vs CLB

- Application: Layer 7 Requests. HTTP and HTTPS traffic. Routing Rules, more usability from one load balancer. Can attach WAF.
- Network: Layer 4 IP protocol data. TCP and TLS traffic where extreme performance is required. Capable of handling millions of requests per second while maintaining ultra low latencies. optimized for sudden and volatile traffic patterns while using a single static IP address per AZ.
- Classic: Layer 4 and 7. Inteded for applications that were built within the EC2 Classic Network. Does not use Target Groups.

> Can attach Amazon Certification Manager (ACM) SSL Certificate.

## SNS vs SES

- Simple Notifications Service: Practical and Internal. Send notifications to subscribers of topics via multiple protocol (HTTP, Email, SQS, SMS...) SNS is generally used for sending plain text emails which is triggered via other AWS Services. The best example of this is billing alarms. //TODO- Topics and subscriptions of SNS

- Simple Email Services: Professional, Marketing, Emails. A cloud based email service eg. SendGrid. SES sends html emails, SNS cannot. SES can recive inbound emails. SES can create Email Temoplates. Custom domain name emails. Monitor your email reputation.

## Artifact vs Inspector

Both compile out PDFs

- AWS Artifact: Why should an enterprise trust AWS? Generates a security report thats based on global compliance frameworks such as Service Organization Control or Payment Card Industry

- AWS Inspector: How do we knoe this EC2 instance is Secure? Prove it? Runs a script that analyzes your EC2 instance, then generates a PDF report telling you which security checks passed. Audit tool for security of EC2 instances.
