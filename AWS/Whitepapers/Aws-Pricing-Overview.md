# Key Principles

## Understand the fundamentals of pricing

There are three fundamental drivers of cost with AWS: compute, storage, and outbound data transfer. These characteristics vary somewhat, depending on the AWS product and pricing model you choose. Outbound data transfer is aggregated across services and then charged at the outbound data transfer rate. This charge appears on the monthly statement as AWS Data Transfer Out. The more data you transfer, the less you pay per GB. For compute resources, you pay hourly from the time you launch a resource until the time you terminate it, unless you have made a reservation for which the cost is agreed upon beforehand. For data storage and transfer, you typically pay per GB.

## Start early with cost optimization

As you move from IT being treated as a capital investment that happens periodically to a world where pricing is closely tied to efficient use of resources, it pays to understand what drives cloud pricing so you can build a strategy for optimizing it. Managing cost-effectively from the start ensures that managing cloud investments doesn’t become an obstruction as you grow and scale.

## Maximize the power of flexibility

AWS services are priced independently and transparently, so you can choose and pay for exactly what you need and no more. No minimum commitments or long-term contracts are required unless you choose to save money through a reservation model. By turning off instances you don’t use, you can reduce costs by 70 percent or more compared to using them 24/7. This enables you to be cost-efficient and, at the same time, have all the power you need when workloads are active.

## Use the right pricing model for the job

AWS offers several pricing models depending on product. These include:

- On Demand means you pay for compute or database capacity with no long-term commitments or upfront payments.
- Dedicated Instances (available with Amazon Elastic Compute Cloud (Amazon EC2)) run in a virtual private cloud (VPC) on hardware that’s dedicated to a single customer.
- Spot Instances are an Amazon EC2 pricing mechanism that lets you purchase spare computing capacity with no upfront commitment at discounted hourly rates.
- Reservations provide you with the ability to receive a greater discount, up to 75 percent, by paying for capacity ahead of time.

# Get started with the AWS Free Tier

The AWS Free Tier enables you to gain free, hands-on experience with the AWS platform, products, and services. AWS Free Tier includes offers that expire 12 months after sign-up and others that never expire. This section lists some of the most commonly used AWS Free Tier offers.

- Amazon Elastic Compute Cloud (Amazon EC2): 750 hours per month of Linux, RHEL, or SLES t2.micro instance usage or 750 hours per month of Windows t2.micro instance usage.
- Amazon Simple Storage Service (Amazon S3): 5 GB of Amazon S3 standard storage, 20,000 Get Requests, and 2,000 Put Requests.
- Amazon Relational Database Service (Amazon RDS): 750 hours of Amazon RDS Single-AZ db.t2.micro Instances for running MySQL, PostgreSQL, MariaDB, Oracle BYOL, or SQL Server (running SQL Server Express Edition); 20 GB of database storage; 10 million I/Os; and 20 GB of backup storage.
- Amazon CloudFront: 50 GB Data Transfer Out and 2,000,000 HTTP and HTTPS Requests each month.

The following free-tier offers do not automatically expire at the end of your 12-month AWS Free Tier term and are available to all AWS customers:

- AWS DynamoDB: Up to 200 million requests per month (25 Write Capacity units and 25 Read Capacity units); 25 GB of indexed data storage; 2.5 million read requests per month.
- Amazon Glacier: Retrieve up to 10 GB of your Amazon Glacier data per month for free.
- AWS Lambda: 1 million free requests per month; up to 3.2 million seconds of compute time per

# Pricing details for individual services

## Amazon Elastic Compute Cloud (Amazon EC2)

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers. The simple web service interface of Amazon EC2 allows you to obtain and configure capacity with minimal friction with complete control of your computing resources.

### Pricing models for Amazon EC2

There are four ways to pay for Amazon EC2 instances: On-Demand Instances, Reserved Instances, Spot Instances, and Dedicated Hosts:

- On-Demand Instances: You pay for compute capacity per hour or per second, depending on which instances you run. No longer-term commitments or upfront payments are needed. You can increase or decrease your compute capacity to meet the demands of your application and only pay the specified hourly rates for the instance you use. Recomended for Users who prefer the low cost and flexibility, Applications with short-term, spiky, or unpredictable workloads that cannot be interrupted, Applications being developed or tested on Amazon EC2 for the first time.
- Spot Instances: Allow you to request spare Amazon EC2 computing capacity for up to 90 percent off the On-Demand price. Spot Instances are recommended for Applications that have flexible start and end times, Applications that are only feasible at very low compute prices, Users with urgent computing needs for a lot of additional capacity. If your maximum bid exceeds the current Spot price, your bid request is fulfilled, and your instances will run until either you choose to terminate them or the Spot price exceeds your maximum bid, whichever comes first.
- Reserved Instances: provide you with a significant discount (up to 75 percent) compared to
  On-Demand Instance pricing. In addition, when Reserved Instances are assigned to a specific Availability Zone, they provide a capacity reservation, giving you additional confidence in your ability to launch instances when you need them. Reserved Instances are recommended for Applications with steady-state usage, Applications that require reserve capacity, Customers who can commit to using EC2 over a 1- or 3-year term to reduce their total computing costs.
- Dedicated Hosts: physical EC2 server dedicated for your use. Dedicated Hosts can help you reduce costs by allowing you to use your existing server-bound software licenses, including Windows Server, SQL Server, and SUSE Linux Enterprise Server (subject to your license terms). They can also help you meet compliance requirements.

### Per-second billing

In 2017, we announced per-second billing for usage of Linux instances across On-Demand, Reserved, and Spot Instances. Similarly, provisioned storage for EBS volumes is billed in one-second increments. Per-second billing saves money. It is particularly effective for resources that have periods of low and high usage such as development and testing, data processing, analytics, batch processing, and gaming applications.

### Estimating Amazon EC2 costs

- Clock hours of server time: Resources incur charges when they are running.
- Instance type: Amazon EC2 provides a wide selection of instance types optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity and give you the flexibility to choose the appropriate mix of resources for your applications.
- Pricing model: With On-Demand Instances, you pay for compute capacity by the hour with no required minimum commitments. Reserved Instances give you the option to make a low onetime payment—or no payment at all—for each instance you want to reserve and in turn receive a significant discount on the hourly usage charge for that instance. With Spot Instances, you can bid for unused Amazon EC2 capacity.
- Number of instances: You can provision multiple instances of your Amazon EC2 and AmazonEBS resources to handle peak loads.
- Load balancing: An Elastic Load Balancer can be used to distribute traffic among Amazon EC2 Instances. The number of hours the Elastic Load Balancer runs and the amount of data it processes contribute to the monthly cost.
- Detailed monitoring: You can use Amazon CloudWatch to monitor your EC2 instances.
- Auto Scaling: Auto Scaling automatically adjusts the number of Amazon EC2 instances in your deployment according to conditions you define.
- Elastic IP addresses: You can have one Elastic IP (EIP) address associated with a running instance at no charge.
- Operating systems and software packages: Operating system prices are included in instance prices, unless you choose to bring your own licenses. For commercial software packages AWS doesn’t provide—such as nonstandard operating systems, Oracle Applications, Windows Server applications such as Microsoft SharePoint and Microsoft Exchange—you need to obtain a license from the vendors.

## AWS Lambda

AWS Lambda lets you run code without provisioning or managing servers. You pay only for the compute time you consume—there is no charge when your code is not running. With Lambda, you can run code for virtually any type of application or backend service. Just upload your code and Lambda takes care of everything required to run and scale your code with high availability.

### AWS Lambda pricing

With AWS Lambda, you pay only for what you use. You are charged based on the number of requests for your functions and the time it takes for your code to execute. Lambda registers a request each time it starts executing in response to an event notification or invoke call, including test invokes from the console. You are charged for the total number of requests across all your functions. Duration is calculated from the time your code begins executing until it returns or otherwise terminates, rounded up to the nearest 100 milliseconds. The price depends on the amount of memory you allocate to your function.

**Request pricing**

- Free Tier: 1 million requests per month, 400,000 GB-seconds of compute time per month
- $0.20 per 1 million requests thereafter, or $0.0000002 per request

**Duration pricing**

- 400,000 GB-seconds per month free, up to 3.2 million seconds of compute time
- \$0.00001667 for every GB-second used thereafter

**Aditional Charges**
You may incur additional charges if your Lambda function uses other AWS services or transfers data.

## Amazon Elastic Block Store (Amazon EBS)

Provides block level storage volumes for use with Amazon EC2 instances. Amazon EBS volumes are off-instance storage that persists independently from the life of an instance. They are analogous to virtual disks in the cloud. Amazon EBS provides two volume types:

- SSD-backed volumes are optimized for transactional workloads involving frequent read/write operations with small I/O size, where the dominant performance attribute is IOPS.
- HDD-backed volumes are optimized for large streaming workloads where throughput (measured in megabits per second) is a better performance measure than IOPS.

### How Amazon EBS is priced

Amazon EBS pricing includes three factors:

- Volumes: Volume storage for all EBS volume types is charged by the amount of GB you provision per month, until you release the storage.
- Snapshots: Snapshot storage is based on the amount of space your data consumes in Amazon S3. Because Amazon EBS does not save empty blocks, it is likely that the snapshot size will be considerably less than your volume size. Copying EBS snapshots is charged based on the volume of data transferred across regions. For the first snapshot of a volume, Amazon EBS saves a full copy of your data to Amazon S3. For each incremental snapshot, only the changed part of your Amazon EBS volume is saved. After the snapshot is copied, standard EBS snapshot charges apply for storage in the destination region.
- Data transfer: Consider the amount of data transferred out of your application. Inbound data transfer is free, and outbound data transfer charges are tiered.

## Amazon Simple Storage Service (Amazon S3)

Amazon S3 is object storage built to store and retrieve any amount of data from anywhere: websites, mobile apps, corporate applications, and data from IoT sensors or devices. It is designed to deliver 99.999999999 percent durability, and stores data for millions of applications used by market leaders in every industry. As with other AWS services, Amazon S3 provides the simplicity and cost-effectiveness of pay-as-you-go pricing.

### Estimating Amazon S3 storage costs

You pay only for the storage you use, with no minimum fee. Prices are based on the location of your Amazon S3 bucket. When you begin to estimate the cost of Amazon S3, consider the following:

- Storage class: Standard Storage is designed to provide 99.999999999 percent durability and 99.99 percent availability. Standard – Infrequent Access (SIA) is a storage option within Amazon S3 you can use to reduce your costs by storing less-frequently accessed data at slightly lower levels of redundancy than the standard Amazon S3 storage.
- Storage: Costs vary with number and size of objects stored in your Amazon S3 buckets as well as type of storage.
- Requests: The number and type of requests. GET requests incur charges at different rates than other requests, such as PUT and COPY requests.
- Data transfer: The amount of data transferred out of the Amazon S3 region.

## Amazon S3 Glacier

Secure, durable, and extremely low-cost cloud storage service for data archiving and long-term backup. It is designed to deliver 99.999999999 percent durability, with comprehensive security and compliance capabilities that can help meet even the most stringent regulatory requirements. Amazon Glacier provides query-in-place functionality, allowing you to run powerful analytics directly on your archived data at rest.

### Amazon Glacier provides low-cost, long-term storage

Starting at \$0.004 per GB per month, Amazon Glacier allows you to archive large amounts of data at a very low cost. You pay only for what you need, with no minimum commitments or upfront fees. Other factors determining pricing include requests and data transfers out of Amazon Glacier (incoming transfers are free).

### Data access options

Amazon Glacier provides three options foraccess to archives that span a few minutes to several hours:

- Expedited: Data access 1-5 minutes, Data Retrievals 0.03 per GB, Retrieval Requests 0.01 (On demand) / 100 per provisioned unit (provisioned)
- Standard: Data access 3–5 hours, Data Retrievals 0.01 per GB, Retrieval Requests 0.050 per 1,000 requests
- Bulk: Data access 5-12 hours, Data Retrievals 0.0025 per GB, Retrieval Requests 0.050 per 1,000 requests 0.025 per 1,000 requests

**Storage and bandwidth include all file overhead** Rate tiers take into account your aggregate usage for Data Transfer Out to the internet across Amazon EC2, Amazon S3, Amazon Glacier, Amazon RDS, Amazon SimpleDB, Amazon SQS, Amazon SNS, Amazon DynamoDB, and AWS Storage Gateway.
**Amazon Glacier Select pricing** Amazon Glacier Select allows queries to run directly on data stored in Amazon Glacier without having to retrieve the entire archive. Pricing for this feature is based on the total amount of data scanned, the amount of data returned by Amazon Glacier Select, and the number of Amazon Glacier Select requests initiated.

## AWS Snowball

AWS Snowball is a PB-scale data transport solution that uses secure appliances to transfer large amounts of data into and out of the AWS cloud. Using Snowball addresses common challenges with large-scale data transfers, including high network costs, long transfer times, and security concerns. Transferring data with Snowball is simple, fast, and secure, and can be as little as one-fifth the cost of high-speed internet. you pay a service fee per data transfer job and the cost of shipping the appliance.  
Each job includes the use of a Snowball appliance for 10 days of onsite usage for free; there is a small charge for extra onsite days. Shipping days, including the day the appliance is received and the day it is shipped back to AWS, are not counted toward the 10 free days. Data transferred into AWS does not incur any data transfer fees.

### AWS Snowball pricing details

- Service fee per job: Snowball 50 TB 200, Snowball 80 TB 250
- Extra-day charge: The first 10 days of onsite usage are free. Each extra onsite day is 15
- Data transfer: Data transfer in to Amazon S3 is free. Data transfer out of Amazon S3 is priced by region.

## Amazon RDS

Amazon RDS is a web service that makes it easy to set up, operate, and scale a relational database in the cloud. It provides cost-efficient and resizable capacity while managing time-consuming database administration tasks, so you can focus on your applications and business.

### Estimating Amazon RDS costs

- Clock hours of server time: Resources incur charges when they are running.
- Database characteristics: The physical capacity of the database you choose will affect how much you are charged. Database characteristics vary depending on the database engine, size, and memory class.
- Database purchase type: When you use On-Demand DB Instances, you pay for compute capacity for each hour your DB Instance runs, with no required minimum commitments. With Reserved DB Instances, you can make a low, one-time, upfront payment for each DB Instance you wish to reserve for a 1- or 3-year term.
- Number of database instances: With Amazon RDS, you can provision multiple DB instances to handle peak loads.
- Provisioned storage: There is no additional charge for backup storage of up to 100 percent of your provisioned database storage for an active DB Instance. After the DB Instance is terminated, backup storage is billed per GB per month.
- Additional storage: The amount of backup storage in addition to the provisioned storage amount is billed per GB per month.
- Requests: The number of input and output requests to the database.
- Deployment type: You can deploy your DB Instance to a single Availability Zone or multiple Availability Zones. Storage and I/O charges vary, depending on the number of Availability Zones you deploy to.
- Data transfer: Inbound data transfer is free, and outbound data transfer costs are tiered.

## Amazon DynamoDB

Is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale. It is a fully managed cloud database and supports both document and key-value store models. Its flexible data model, reliable performance, and automatic scaling of throughput capacity make it a great fit for mobile, web, gaming, ad tech, IoT, and many other applications.

### Amazon DynamoDB pricing at a glance

DynamoDB simply asks you to specify the target utilization rate and minimum to maximum capacity that you want for your table. DynamoDB handles the provisioning of resources to achieve your target utilization of read and write capacity, then auto-scales your capacity based on usage. Optionally, you can directly specify read and write capacity if you prefer to manually manage table throughput.

| Resource Type                  | Details                                                                                                    | Montly Price             |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------- | ------------------------ |
| Provisioned throughput (write) | One write capacity unit (WCU) provides up to one write per second, enough for 2.5 million writes per month | As low as \$0.47 per WCU |
| Provisioned throughput (read)  | One read capacity unit (RCU) provides up to two reads per second, enough for 5.2 million reads per month.  | As low as \$0.09 per RCU |
| Indexed data storage           | DynamoDB charges an hourly rate per GB of disk space that your table consumes.                             | As low as \$0.25 per GB  |

**Indexed data storage**

Amazon DynamoDB is an SSD-backed indexed datastore. The amount of disk space your data consumes will exceed the raw size of the data you have uploaded. Amazon DynamoDB measures the size of your billable data by adding up the raw byte size of the data you upload, plus a per-item storage overhead of 100 bytes to account for indexing. You do not need to “provision” storage with Amazon DynamoDB. You are simply billed for what you use, as described above.

**Data transfer**

Amazon DynamoDB is an SSD-backed indexed datastore. The amount of disk space your data consumes will exceed the raw size of the data you have uploaded. Amazon DynamoDB measures the size of your billable data by adding up the raw byte size of the data you upload, plus a per-item storage overhead of 100 bytes to account for indexing. You do not need to “provision” storage with Amazon DynamoDB. You are simply billed for what you use, as described above. Data transferred across Regions will be charged on both sides of the transfer.

### Global Tables

Global Tables builds on DynamoDB’s global footprint to provide you with a fully managed, multiregion, and multimaster database that provides fast local read and write performance for massively scaled, global applications. Global Tables replicates your Amazon DynamoDB tables automatically across your choice of AWS regions. When using Global Tables, you are charged based on the resources associated with each replica table. Write capacity for Global Tables is represented by replicated write capacity units (rWCUs) instead of standard write capacity units (WCUs)

## Amazon CloudFront

Amazon CloudFront is a global content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to your viewers with low latency and high transfer speeds.

### Amazon CloudFront pricing

charges are based on the data transfers and requests used to deliver content to your customers. There are no upfront payments or fixed platform fees, no long-term commitments, no premiums for dynamic content, and no requirements for professional services to get started. There is no charge for data transferred. You can get started with CloudFront for free. For estimating the cost of Amazon CloudFront, consider the following:

- Traffic distribution: Data transfer and request pricing varies across geographic regions, and pricing is based on the edge location through which your content is served.
- Requests: The number and type of requests (HTTP or HTTPS) made and the geographic region in which the requests are made.
- Data transfer out: The amount of data transferred out of your Amazon CloudFront edge locations.
