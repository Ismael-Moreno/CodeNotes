# What is Amazon S3

Amazon S3 stores data as objects in a flat environment (without a hierarchy). Each object (file) in the storage contains a header with an associated sequence of bytes from 0 bytes to 5 TB. Objects in Amazon S3 are associated with a unique identifier (key), so access to them can be obtained through web requests from anywhere. For example, any authorized node in your own datacenter or external user can get access to any object in your Amazon S3 bucket.

Amazon S3 also allows hosting static website content. You can get access to it either from your Amazon S3 bucket or through content delivery network AWS CloudFront. Amazon S3 is a highly scalable storage service with famous "eleven nines" data durability  (99,999999999%). That means that the chance of your data to be lost somewhere inside AWS datacenters is minimal.

# What is Amazon EBS

Every computer needs a drive and virtual machine is not an exception. Amazon EBS is a storage for the drives of your virtual machines. It stores data as blocks of the same size and organizes them through the hierarchy similar to a traditional file system. EBS is not a standalone storage service like Amazon S3 so you can use it only in combination with Amazon EC2, a cloud computing service by AWS.

Amazon EBS is designed to store data in volumes of a provisioned size attached to an Amazon EC2 instance, similar to a local disk drive on your physical machine. Amazon EBS only allows to attach the volume to another EC2 instance or keep it in a standby mode. It’s important as once you configure the volume in Amazon EBS, it can’t be easily scaled. If you need more storage space, you will need to buy and configure a new volume of a bigger size.

# Amazon EBS volume types

There are three types of volumes in Amazon EBS. To understand the difference, you need to know what IOPS is. “IOPS” stands for input/output operations per second or, put it simply, the maximum amount of read/write operations you are able to perform per second. To choose the right Amazon EBS volume type you need to know IOPS requirements for your application.

## General Purpose (SSD) Volumes

Designed for a broad range of tasks, General Purpose Volumes are backed with Solid State Drive (SSD). The baseline performance of 3 IOPS/GB and a possibility to burst up to 10,000 IOPS makes them a good fit for AWS databases that need a lot of read and write operations.

## Provisioned IOPS (SSD) Volumes

By expanding the bandwidth bottleneck, Provisioned IOPS Volumes allow buying read/write operations on demand regardless of the volume capacity. This type of EBS volumes is backed with the same SSD but designed for heavy workloads from 30 IOPS/GB up to 20,000 IOPS. Multiple Provisioned IOPS volumes can be striped thus ensuring up to 48,000 IOPS or 800 MBps of throughput.

## Magnetic Volumes

The best way to think of the Magnetic Volumes type is as of a low-cost volume that can be used with testing and development environments on Amazon EC2. It can also be used with applications that don’t require a lot of read/write operations. Instead of SSD, this type is based on magnetic HDD drives, thus the IOPS baseline is within the range of 100 up to hundreds of IOPS. Magnetic Volumes can also become a starting point in working with Amazon EC2

# What is Amazon EFS

At some point, it became clear that EBS may be good for setting up a drive for virtual machines, and S3 is good for storage, but what if you want to run an application with high workloads that need scalable storage and relatively fast output? Amazon Elastic File System was created to fulfill those needs. Amazon EFS is automatically scalable - that means that your running applications won't have any problems if the workload suddenly becomes higher - the storage will scale itself automatically. If the workload decreases - the storage will scale down, so you won't pay anything for the storage you don't use.

You can mount EFS to various AWS services and access it from various virtual machines. Amazon EFS is especially helpful for running servers, shared volumes (like NAS devices), big data analysis, and any scalable workload you can think of.

# Amazon S3 vs EFS vs EBS Comparison

| AMAZON S3	| AMAZON EBS | AMAZON EFS |
| --------- | ---------- | ---------- |
| Can be publicly accessible | Accessible only via the given EC2 Machine | Accessible via several EC2 machines and AWS services |
| Web interface | File System interface | Web and file system interface |
| Object Storage | Block Storage | Object storage |
| Scalable | Hardly scalable | Scalable |
| Slower than EBS and EFS | Faster than S3 and EFS | Faster than S3, slower than EBS |
| Good for storing backups | Is meant to be EC2 drive | Good for shareable applications and workloads |

