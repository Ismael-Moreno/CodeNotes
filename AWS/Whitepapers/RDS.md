# Why do you want a managed relational database service?

- When you buy a server, you get CPU, memory, storage, and IOPS, all bundled together. With Amazon RDS, these are split apart so that you can scale them independently. If you need more CPU, less IOPS, or more storage, you can easily allocate them.
- Amazon RDS manages backups, software patching, automatic failure detection, and recovery.
- To deliver a managed service experience, Amazon RDS doesn't provide shell access to DB instances. It also restricts access to certain system procedures and tables that require advanced privileges.
- You can have automated backups performed when you need them, or manually create your own backup snapshot. You can use these backups to restore a database. The Amazon RDS restore process works reliably and efficiently.
- You can get high availability with a primary instance and a synchronous secondary instance that you can fail over to when problems occur. You can also use MySQL, MariaDB, or PostgreSQL read replicas to increase read scaling.
- You can use the database products you are already familiar with: MySQL, MariaDB, PostgreSQL, Oracle, Microsoft SQL Server.
- In addition to the security in your database package, you can help control who can access your RDS databases by using AWS Identity and Access Management (IAM) to define users and permissions. You can also help protect your databases by putting them in a virtual private cloud.

# DB Instances

The basic building block of Amazon RDS is the DB instance. A DB instance is an isolated database environment in the AWS Cloud. Your DB instance can contain multiple user-created databases. You can access your DB instance by using the same tools and applications that you use with a standalone database instance. You can create and modify a DB instance by using the AWS Command Line Interface, the Amazon RDS API, or the AWS Management Console.

Each DB instance runs a DB engine. Amazon RDS currently supports the MySQL, MariaDB, PostgreSQL, Oracle, Microsoft SQL Server and Amazon Aurora DB engines. Each DB engine has its own supported features, and each version of a DB engine may include specific features. Additionally, each DB engine has a set of parameters in a DB parameter group that control the behavior of the databases that it manages.

The computation and memory capacity of a DB instance is determined by its DB instance class. You can select the DB instance that best meets your needs. DB instance storage comes in three types: Magnetic, General Purpose (SSD), and Provisioned IOPS (PIOPS).

You can run your DB instance in several Availability Zones, an option called a Multi-AZ deployment. When you choose this option, Amazon automatically provisions and maintains a secondary standby DB instance in a different Availability Zone. Your primary DB instance is synchronously replicated across Availability Zones to the secondary instance. This approach helps provide data redundancy and failover support, eliminate I/O freezes, and minimize latency spikes during system backups.

You can have up to 40 Amazon RDS DB instances, with the following limitations:
- 10 for each SQL Server edition (Enterprise, Standard, Web, and Express) under the "license-included" model
- 10 for Oracle under the "license-included" model
- 40 for MySQL, MariaDB, or PostgreSQL
- 40 for Oracle under the "bring-your-own-license" (BYOL) licensing model

Each DB instance has a DB instance identifier. This customer-supplied name uniquely identifies the DB instance when interacting with the Amazon RDS API and AWS CLI commands. The DB instance identifier must be unique for that customer in an AWS Region. The identifier is used as part of the DNS hostname allocated to your instance by RDS. E.g: db1.123456789012.us-east-1.rds.amazonaws.com, where 123456789012 is the fixed identifier for a specific region for your account.

When creating a DB instance, some database engines require that a database name be specified. A DB instance can host multiple databases, or a single Oracle database with multiple schemas. The database name value depends on the database engine:
- For the MySQL and MariaDB database engines, the database name is the name of a database hosted in your DB instance. Databases hosted by the same DB instance must have a unique name within that instance.
- For the Oracle database engine, database name is used to set the value of ORACLE_SID, which must be supplied when connecting to the Oracle RDS instance.
- For the Microsoft SQL Server database engine, database name is not a supported parameter.
- For the PostgreSQL database engine, the database name is the name of a database hosted in your DB instance. A database name is not required when creating a DB instance. Databases hosted by the same DB instance must have a unique name within that instance.

Amazon RDS creates a master user account for your DB instance as part of the creation process. This master user has permissions to create databases and to perform create, delete, select, update, and insert operations on tables the master user creates. You must set the master user password when you create a DB instance, but you can change it at any time using the Amazon AWS command line tools, Amazon RDS API operations, or the AWS Management Console. You can also change the master user password and manage users using standard SQL commands.

# DB Instance Classes

The DB instance class determines the computation and memory capacity of an Amazon RDS DB instance. The DB instance class you need depends on your processing power and memory requirements.

## DB Instance Class Types

Amazon RDS supports three types of instance classes: Standard, Memory Optimized, and Burstable Performance. The following are the Standard DB instance classes available:
- db.m5 – Latest-generation general-purpose instance classes that provide a balance of compute, memory, and network resources, and are a good choice for many applications. The db.m5 instance classes provide more computing capacity than the previous db.m4 instance classes. They are powered by the AWS Nitro System, a combination of dedicated hardware and lightweight hypervisor.
- db.m4 – Current-generation general-purpose instance classes that provide more computing capacity than the previous db.m3 instance classes.
- db.m3 – Previous-generation general-purpose instance classes that provide more computing capacity than the previous db.m1 instance classes.
- db.m1 – Previous-generation general-purpose instance classes.
The following are the Memory Optimized DB instance classes available:
- db.z1d – Latest-generation instance classes optimized for memory-intensive applications.
- db.x1e – Latest-generation instance classes optimized for memory-intensive applications. These offer one of the lowest price per GiB of RAM, up to 3,904 GiB of DRAM.
- db.x1 – Current-generation instance classes optimized for memory-intensive applications. These offer one of the lowest price per GiB of RAM among the DB instance classes and up to 1,952 GiB of DRAM-based instance memory.
- db.r5 – Latest-generation instance classes optimized for memory-intensive applications. These offer improved networking and Amazon Elastic Block Store (Amazon EBS) performance. They are powered by the AWS Nitro System, a combination of dedicated hardware and lightweight hypervisor.
- db.r4 – Current-generation instance classes optimized for memory-intensive applications. These offer improved networking and Amazon EBS performance.
- db.r3 – Previous-generation instance classes that provide memory optimization.
- db.m2 – Previous-generation memory-optimized instance classes.
The following are the Burstable Performance DB instance classes available:
- db.t3 – Latest-generation instance classes that provide a baseline performance level, with the ability to burst to full CPU usage. These instance classes provide more computing capacity than the previous db.t2 instance classes. They are powered by the AWS Nitro System
- db.t2 – Current-generation instance classes that provide a baseline performance level, with the ability to burst to full CPU usage.

## Terminology for DB Instance Class Hardware Specifications

The following terminology is used to describe hardware specifications for DB instance classes:
- vCPU – The number of virtual central processing units (CPUs). A virtual CPU is a unit of capacity that you can use to compare DB instance classes. Instead of purchasing or leasing a particular processor to use for several months or years, you are renting capacity by the hour. Our goal is to make a consistent and specific amount of CPU capacity available, within the limits of the actual underlying hardware.
- ECU – The relative measure of the integer processing power of an Amazon EC2 instance. To make it easy for developers to compare CPU capacity between different instance classes, we have defined an Amazon EC2 Compute Unit. The amount of CPU that is allocated to a particular instance is expressed in terms of these EC2 Compute Units.
- Memory (GiB) – The RAM, in gibibytes, allocated to the DB instance. There is often a consistent ratio between memory and vCPU.
- VPC Only – The instance class is supported only for DB instances that are in a VPC based on the Amazon VPC service.
- EBS-Optimized – The DB instance uses an optimized configuration stack and provides additional, dedicated capacity for I/O. This optimization provides the best performance by minimizing contention between I/O and other traffic from your instance.
- Max. Bandwidth (Mbps) – The maximum bandwidth in megabits per second. Divide by 8 to get the expected throughput in megabytes per second.
- Network Performance – The network speed relative to other DB instance classes.

# Amazon RDS DB Instance Storage

DB instances for Amazon RDS for MySQL, MariaDB, PostgreSQL, Oracle, and Microsoft SQL Server use Amazon Elastic Block Store (Amazon EBS) volumes for database and log storage. Depending on the amount of storage requested, Amazon RDS automatically stripes across multiple Amazon EBS volumes to enhance performance.

## Amazon RDS Storage Types

Amazon RDS provides three storage types: General Purpose SSD (also known as gp2), Provisioned IOPS SSD (also known as io1), and magnetic. They differ in performance characteristics and price, which means that you can tailor your storage performance and cost to the needs of your database workload. You can create MySQL, MariaDB, Oracle, and PostgreSQL RDS DB instances with up to 64 TiB of storage. You can create SQL Server RDS DB instances with up to 16 TiB of storage.

### General Purpose SSD
General Purpose SSD volumes offer cost-effective storage that is ideal for a broad range of workloads. These volumes deliver single-digit millisecond latencies and the ability to burst to 3,000 IOPS for extended periods of time. Baseline performance for these volumes is determined by the volume's size. General Purpose SSD storage offers cost-effective storage that is acceptable for most database workloads. The following are the storage size ranges for General Purpose SSD DB instances:
    - MariaDB, MySQL, Oracle, and PostgreSQL database instances: 20 GiB–64 TiB
    - SQL Server for Enterprise, Standard, Web, and Express editions: 20 GiB–16 TiB
Baseline I/O performance for General Purpose SSD storage is 3 IOPS for each GiB, with a minimum of 100 IOPS. This relationship means that larger volumes have better performance.

**I/O Credits and Burst Performance** General Purpose SSD storage performance is governed by volume size, which dictates the base performance level of the volume and how quickly it accumulates I/O credits. Larger volumes have higher base performance levels and accumulate I/O credits faster. I/O credits represent the available bandwidth that your General Purpose SSD storage can use to burst large amounts of I/O when more than the base level of performance is needed. The more I/O credits your storage has for I/O, the more time it can burst beyond its base performance level and the better it performs when your workload requires more performance.

### Provisioned IOPS
Provisioned IOPS storage is designed to meet the needs of I/O-intensive workloads, particularly database workloads, that require low I/O latency and consistent I/O throughput. For a production application that requires fast and consistent I/O performance, we recommend Provisioned IOPS (input/output operations per second) storage. Provisioned IOPS storage is a storage type that delivers predictable performance, and consistently low latency. Provisioned IOPS storage is optimized for online transaction processing (OLTP) workloads that have consistent performance requirements. Provisioned IOPS helps performance tuning of these workloads. The following table shows the range of Provisioned IOPS and storage size range for each database engine:

| Database Engine | Range of Provisioned IOPS | Range of Storage |
| --------------- | ------------------------- | ---------------- |
| MariaDB | 1,000–80,000 IOPS | 100 GiB–64 TiB |
| SQL Server Enterprise, Standard, and Web Editions | 1,000–64,000 IOPS* | 20 GiB–16 TiB |
| SQL Server Express Edition |1,000–64,000 IOPS* | 100 GiB–16 TiB |
| MySQL | 1,000–80,000 IOPS | 100 GiB–64 TiB |
| Oracle | 1,000–80,000 IOPS | 100 GiB–64 TiB |
| PostgreSQL | 1,000–80,000 IOPS | 100 GiB–64 TiB |

> Maximum IOPS of 64,000 is guaranteed only on Nitro-based instances that are on the m5, r5, and z1d instance types. Other instance families guarantee performance up to 32,000 IOPS.

### Magnetic Storage
Amazon RDS also supports magnetic storage for backward compatibility. We recommend that you use General Purpose SSD or Provisioned IOPS for any new storage needs. The maximum amount of storage allowed for DB instances on magnetic storage is less than that of the other storage types. Amazon RDS also supports magnetic storage for backward compatibility. We recommend that you use General Purpose SSD or Provisioned IOPS SSD for any new storage needs. The following are some limitations for magnetic storage:
- Doesn't allow you to scale storage when using the SQL Server database engine.
- Doesn't support storage autoscaling.
- Doesn't support elastic volumes.
- Limited to a maximum size of 3 TiB.
- Limited to a maximum of 1,000 IOPS.

## Monitoring Storage Performance

The following metrics are useful for monitoring storage for your DB instance:
- IOPS: The number of I/O operations completed each second. This metric is reported as the average IOPS for a given time interval. Amazon RDS reports read and write IOPS separately on 1-minute intervals. Total IOPS is the sum of the read and write IOPS. Typical values for IOPS range from zero to tens of thousands per second.
- Latency: The elapsed time between the submission of an I/O request and its completion. This metric is reported as the average latency for a given time interval. Amazon RDS reports read and write latency separately on 1-minute intervals in units of seconds. Typical values for latency are in the millisecond (ms).
- Throughput: The number of bytes each second that are transferred to or from disk. This metric is reported as the average throughput for a given time interval. Amazon RDS reports read and write throughput separately on 1-minute intervals using units of megabytes per second (MB/s). Typical values for throughput range from zero to the I/O channel’s maximum bandwidth.
- Queue Depth: The number of I/O requests in the queue waiting to be serviced. These are I/O requests that have been submitted by the application but have not been sent to the device because the device is busy servicing other I/O requests. Time spent waiting in the queue is a component of latency and service time (not available as a metric). This metric is reported as the average queue depth for a given time interval. Amazon RDS reports queue depth in 1-minute intervals. Typical values for queue depth range from zero to several hundred.
    > Measured IOPS values are independent of the size of the individual I/O operation. This means that when you measure I/O performance, you should look at the throughput of the instance, not simply the number of I/O operations.

> [Comparing performance: burst vs. baseline examples](https://aws.amazon.com/es/blogs/database/understanding-burst-vs-baseline-performance-with-amazon-rds-and-gp2/)


