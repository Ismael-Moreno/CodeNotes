# General

## What is Amazon Elastic Compute Cloud (Amazon EC2)?
Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud. It is designed to make web-scale computing easier for developers.

## What can I do with Amazon EC2?
Amazon EC2 enables “compute” in the cloud. Amazon EC2’s simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on Amazon’s proven computing environment. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change. Amazon EC2 changes the economics of computing by allowing you to pay only for capacity that you actually use.

## What can developers now do that they could not before?
Amazon EC2 enables any developer to leverage Amazon’s own benefits of massive scale with no up-front investment or performance compromises. Developers are now free to innovate knowing that no matter how successful their businesses become, it will be inexpensive and simple to ensure they have the compute capacity they need to meet their business requirements. The "Elastic" nature of the service allows developers to instantly scale to meet spikes in traffic or demand. When computing requirements unexpectedly change (up or down), Amazon EC2 can instantly respond, meaning that developers have the ability to control how many resources are in use at any given point in time.

## How do I run systems in the Amazon EC2 environment?
Once you have set up your account and select or create your AMIs, you are ready to boot your instance. You can start your AMI on any number of On-Demand instances by using the RunInstances API call. You simply need to indicate how many instances you wish to launch. If you have a running instance using an Amazon EBS boot partition, you can also use the StopInstances API call to release the compute resources but preserve the data on the boot partition. You can use the StartInstances API when you are ready to restart the associated instance with the Amazon EBS boot partition.

## What is the difference between using the local instance store and Amazon Elastic Block Store (Amazon EBS) for the root device?
When you launch your Amazon EC2 instances you have the ability to store your root device data on Amazon EBS or the local instance store. By using Amazon EBS, data on the root device will persist independently from the lifetime of the instance. This enables you to stop and restart the instance at a subsequent time, which is similar to shutting down your laptop and restarting it when you need it again. Alternatively, the local instance store only persists during the life of the instance. This is an inexpensive way to launch instances where data is not stored to the root device.

## How quickly will systems be running?
It typically takes less than 10 minutes from the issue of the RunInstances call to the point where all requested instances begin their boot sequences. This time depends on a number of factors including: the size of your AMI, the number of instances you are launching, and how recently you have launched that AMI.

## How do I load and store my systems with Amazon EC2?
Amazon EC2 allows you to set up and configure everything about your instances from your operating system up to your applications. You might have just one AMI or you might compose your system out of several building block AMIs. Once you create a custom AMI, you will need to bundle it. If you are bundling an image with a root device backed by Amazon EBS, you can simply use the bundle command in the AWS Management Console. If you are bundling an image with a boot partition on the instance store, then you will need to use the AMI Tools to upload it to Amazon S3.

## How do I access my systems?
The RunInstances call that initiates execution of your application stack will return a set of DNS names, one for each system that is being booted.

## Is Amazon EC2 used in conjunction with Amazon S3?
Yes, Amazon EC2 is used jointly with Amazon S3 for instances with root devices backed by local instance storage. By using Amazon S3, developers have access to the same highly scalable, reliable, fast, inexpensive data storage infrastructure that Amazon uses to run its own global network of web sites. In order to execute systems in the Amazon EC2 environment, developers use the tools provided to load their AMIs into Amazon S3 and to move them between Amazon S3 and Amazon EC2.

## How many instances can I run in Amazon EC2?
You are limited to running On-Demand Instances per your vCPU-based On-Demand Instance limit, purchasing 20 Reserved Instances, and requesting Spot Instances per your dynamic Spot limit per region. If you need more instances, complete the Amazon EC2 limit increase request form with your use case.

## Are there any limitations in sending email from Amazon EC2 instances?
Yes. In order to maintain the quality of Amazon EC2 addresses for sending email, we enforce default limits on the amount of email that can be sent from EC2 accounts.

## How quickly can I scale my capacity both up and down?
Amazon EC2 provides a truly elastic computing environment. Amazon EC2 enables you to increase or decrease capacity within minutes, not hours or days. You can commission one, hundreds or even thousands of server instances simultaneously. When you need more instances, you simply call RunInstances, and Amazon EC2 will typically set up your new instances in a matter of minutes.

## What operating system environments are supported?
Amazon EC2 currently supports a variety of operating systems including: Amazon Linux, Ubuntu, Windows Server, Red Hat Enterprise Linux, SUSE Linux Enterprise Server, openSUSE Leap, Fedora, Fedora CoreOS, Debian, CentOS, Gentoo Linux, Oracle Linux, and FreeBSD.

## Does Amazon EC2 use ECC memory?
In our experience, ECC memory is necessary for server infrastructure, and all the hardware underlying Amazon EC2 uses ECC memory.

## What are vCPU-based limits?
You are limited to running one or more On-Demand Instances in an AWS account, and Amazon EC2 measures usage towards each limit based on the total number of vCPUs (virtual central processing unit) that are assigned to the running On-Demand instances in your AWS account. The following table shows the number of vCPUs for each instance size. 
| Instance Size | vCPUs |
| ------------- | ----- |
| nano | 1 |
| micro | 1 |
| small | 1 |
| medium | 1 |
| large | 2 |
| xlarge | 4 |
| 2xlarge | 8 |
| ....... | .. |
| 32xlarge | 128 |

## How many On-Demand instances can I run in Amazon EC2?

There are five vCPU-based instance limits, each defines the amount of capacity you can use of a given instance family. All usage of instances in a given family, regardless of generation, size, or configuration variant (e.g. disk, processor type), will accrue towards the family’s total vCPU limit

## Are these On-Demand Instance vCPU-based limits regional?

Yes, the On-Demand Instance limits for an AWS account are set on a per-region basis.

## Will these limits change over time?

Yes, limits can change over time. Amazon EC2 is constantly monitoring your usage within each region and your limits are raised automatically based on your use of EC2.

## How can I calculate my new vCPU limit?

You can find the vCPU mapping for each of the Amazon EC2 Instance Types or use the simplified vCPU Calculator to compute the total vCPU limit requirements for your AWS account.

## Do vCPU limits apply when purchasing Reserved Instances or requesting Spot Instances?

No, the vCPU-based limits only apply to running On-Demand instances.

## Will this affect running instances?

No, opting into vCPU-based limits will not affect any running instances.

## Can I still launch the same number of instances?

Yes, the vCPU-based instance limits allow you to launch at least the same number of instances as count-based instance limits.

## Will the vCPU limits have an impact on my monthly bill?

No. EC2 usage is still calculated either by the hour or the second, depending on which AMI you're running and the instance type and size you’ve launched.

## Will vCPU limits be available in all Regions?

vCPU-based instance limits are available in all commercial AWS Regions except the AWS China (Beijing and Ningxia) Regions and they are available in AWS GovCloud (US).

## What does your Amazon EC2 Service Level Agreement guarantee?

Our SLA guarantees a Monthly Uptime Percentage of at least 99.99% for Amazon EC2 and Amazon EBS within a Region.

## How do I know if I qualify for a SLA Service Credit?

You are eligible for a SLA credit for either Amazon EC2 or Amazon EBS (whichever was Unavailable, or both if both were Unavailable) if the Region that you are operating in has an Monthly Uptime Percentage of less than 99.95% during any monthly billing cycle.

# Instance Types

# Accelerated Computing instances

## What are Accelerated Computing instances?

Accelerated Computing instance family is a family of instances which use hardware accelerators, or co-processors, to perform some functions, such as floating-point number calculation and graphics processing, more efficiently than is possible in software running on CPUs. mazon EC2 provides three types of Accelerated Computing instances – GPU compute instances for general-purpose computing, GPU graphics instances for graphics intensive applications, and FPGA programmable hardware compute instances for advanced scientific workloads.

## When should I use GPU Graphics and Compute instances?

GPU instances work best for applications with massive parallelism such as workloads using thousands of threads.

## How are P3 instances different from G3 instances?

P3 instances are the next-generation of EC2 general-purpose GPU computing instances, powered by up to 8 of the latest-generation NVIDIA Tesla V100 GPUs. These new instances significantly improve performance and scalability, and add many new features, including new Streaming Multiprocessor (SM) architecture for machine learning (ML)/deep learning (DL) performance optimization, second-generation NVIDIA NVLink high-speed GPU interconnect, and highly tuned HBM2 memory for higher-efficiency.  

G3 instances use NVIDIA Tesla M60 GPUs and provide a high-performance platform for graphics applications using DirectX or OpenGL. NVIDIA Tesla M60 GPUs support NVIDIA GRID Virtual Workstation features, and H.265 (HEVC) hardware encoding. Each M60 GPU in G3 instances supports 4 monitors with resolutions up to 4096x2160, and is licensed to use NVIDIA GRID Virtual Workstation for one Concurrent Connected User. 

## What are the benefits of NVIDIA Volta GV100 GPUs?

The new NVIDIA Tesla V100 accelerator incorporates the powerful new Volta GV100 GPU. GV100 not only builds upon the advances of its predecessor, the Pascal GP100 GPU. These advances will supercharge HPC, data center, supercomputer, and deep learning systems and applications.

## Who will benefit from P3 instances?

P3 instances with their high computational performance will benefit users in artificial intelligence (AI), machine learning (ML), deep learning (DL) and high performance computing (HPC) applications. Users includes data scientists, data architects, data analysts, scientific researchers, ML engineers, IT managers and software developers.

## What are some key use cases of P3 instances?

P3 instance use GPUs to accelerate numerous deep learning systems and applications including autonomous vehicle platforms, speech, image, and text recognition systems, intelligent video analytics, molecular simulations, drug discovery, disease diagnosis, weather forecasting...

## Why should customers use GPU-powered Amazon P3 instances for AI/ML and HPC?

GPU-based compute instances provide greater throughput and performance because they are designed for massively parallel processing using thousands of specialized cores per GPU, versus CPUs offering sequential processing with a few cores.

## Will P3 instances support EC2 Classic networking and Amazon VPC?

P3 instances will support VPC only.

## How are G3 instances different from P2 instances?

G3 instances use NVIDIA Tesla M60 GPUs and provide a high-performance platform for graphics applications using DirectX or OpenGL. NVIDIA Tesla M60 GPUs support NVIDIA GRID Virtual Workstation features, and H.265 (HEVC) hardware encoding. (Grafic design, video...)

P2 instances use NVIDIA Tesla K80 GPUs and are designed for general purpose GPU computing using the CUDA or OpenCL programming models. P2 instances provide customers with high bandwidth 25 Gbps networking, powerful single and double precision floating-point capabilities, and error-correcting code (ECC) memory, making them ideal for deep learning, high performance databases... (GPU workloads)

## How are P3 instances different from P2 instances?

P3 Instances are the next-generation of EC2 general-purpose GPU computing instances, powered by up to 8 of the latest-generation NVIDIA Volta GV100 GPUs. P2 instances use NVIDIA Tesla K80 GPUs and are designed for general purpose GPU computing using the CUDA or OpenCL programming models.

## What APIs and programming models are supported by GPU Graphics and Compute instances?

P3 instances support CUDA 9 and OpenCL, P2 instances support CUDA 8 and OpenCL 1.2 and G3 instances support DirectX 12, OpenGL 4.5, CUDA 8, and OpenCL 1.2.

## Does the use of G2 and G3 instances require third-party licenses?

Aside from the NVIDIA drivers and GRID SDK, the use of G2 and G3 instances does not necessarily require any third-party licenses. However, you are responsible for determining whether your content or technology used on G2 and G3 instances requires any additional licensing.

## Why am I unable to see the GPU when using Microsoft Remote Desktop?

When using Remote Desktop, GPUs using the WDDM driver model are replaced with a non-accelerated Remote Desktop display driver. In order to access your GPU hardware, you need to utilize a different remote access tool, such as VNC.

## What is Amazon EC2 F1?

Amazon EC2 F1 is a compute instance with programmable hardware you can use for application acceleration. The new F1 instance type provides a high performance, easy to access FPGA for developing and deploying custom hardware accelerations.

## What are FPGAs and why do I need them?

FPGAs are programmable integrated circuits that you can configure using software. By using FPGAs you can accelerate your applications up to 30x when compared with servers that use CPUs alone. And, FPGAs are reprogrammable, so you get the flexibility to update and optimize your hardware acceleration without having to redesign the hardware.

## How does F1 compare with traditional FPGA solutions?

F1 is an AWS instance with programmable hardware for application acceleration. With F1, you have access to FPGA hardware in a few simple clicks, reducing the time and cost of full-cycle FPGA development and scale deployment from months or years to days. With this offering, customers avoid the undifferentiated heavy lifting associated with developing FPGAs in on-premises data centers.

## What is an Amazon FPGA Image (AFI)?

The design that you create to program your FPGA is called an Amazon FPGA Image (AFI). AWS provides a service to register, manage, copy, query, and delete AFIs. After an AFI is created, it can be loaded on a running F1 instance. You can load multiple AFIs to the same F1 instance, and can switch between AFIs in runtime without reboot. This lets you quickly test and run multiple hardware accelerations in rapid sequence. You can also offer to other customers on the AWS Marketplace a combination of your FPGA acceleration and an AMI with custom software or AFI drivers.

## What is available with F1 instances?

For developers, AWS is providing a Hardware Development Kit (HDK) to help accelerate development cycles, a FPGA Developer AMI for development in the cloud, an SDK for AMIs running the F1 instance, and a set of APIs to register, manage, copy, query, and delete AFIs. Both developers and customers have access to the AWS Marketplace where AFIs can be listed and purchased for use in application accelerations.

## Do I need to be a FPGA expert to use an F1 instance?

AWS customers subscribing to a F1-optimized AMI from AWS Marketplace do not need to know anything about FPGAs to take advantage of the accelerations provided by the F1 instance and the AWS Marketplace. The AMI contains all the software necessary for using the FPGA acceleration. Customers need only write software to the specific API for that accelerator and start using the accelerator.

## I’m a FPGA developer, how do I get started with F1 instances?

creating an AWS account and downloading the AWS Hardware Development Kit (HDK). The HDK includes documentation on F1, internal FPGA interfaces, and compiler scripts for generating AFI. Developers can start writing their FPGA code to the documented interfaces included in the HDK to create their acceleration function. Developers can launch AWS instances with the FPGA Developer AMI. Developers should have experience in the programming languages used for creating FPGA code (i.e. Verilog or VHDL) and an understanding of the operation they wish to accelerate.

## Does AWS provide a developer kit?

Yes. The Hardware Development Kit (HDK) includes simulation tools and simulation models for developers to simulate, debug, build, and register their acceleration code. The HDK includes code samples, compile scripts, debug interfaces, and many other tools you will need to develop the FPGA code for your F1 instances. You can use the HDK either in an AWS provided AMI, or in your on-premises development environment. These models and scripts are available publically with an AWS account.

## Can I add an FPGA to any EC2 instance type?

No. F1 instances comes in two instance sizes f1.2xlarge, f1.4xlarge, and f1.16 xlarge.

## How do I use the Inferentia chip in Inf1 instances?

You can start your workflow by building and training your model in one of the popular ML frameworks such as TensorFlow, PyTorch, or MXNet using GPU instances such as P3 or P3dn. Once the model is trained to your required accuracy, you can use the ML framework’s API to invoke Neuron, a software development kit for Inferentia, to compile the model for execution on Inferentia chips, load it in to Inferentia’s memory, and then execute inference calls.

## When would I use Inf1 vs. C5 vs. G4 instances for inference?

Customers running machine learning models that are sensitive to inference latency and throughput can use Inf1 instances for high-performance cost-effective inference. For those ML models that are less sensitive to inference latency and throughput, customers can use EC2 C5 instances and utilize the AVX-512/VNNI instruction set. For ML models that require access to NVIDIA’s CUDA, CuDNN or TensorRT libraries, we recommend using G4 instances.

## When should I choose Elastic Inference (EI) for inference vs Amazon EC2 Inf1 instances?

There are two cases where developers would choose EI over Inf1 instances: (1) if you need different CPU and memory sizes than what Inf1 offers, then you can use EI to attach acceleration to the EC2 instance with the right mix of CPU and memory for your application (2) if your performance requirements are significantly lower than what the smallest Inf1 instance provides, then using EI could be a more cost effective choice.

## What ML models types and operators are supported by EC2 Inf1 instances using the Inferentia chip?

Inferentia chips support the commonly used machine learning models such as single shot detector (SSD) and ResNet for image recognition/classification and Transformer and BERT for natural language processing and translation and many others.

## How do I take advantage of AWS Inferentia’s NeuronCore Pipeline capability to lower latency?

Inf1 instances with multiple Inferentia chips, such as Inf1.6xlarge or Inf1.24xlarge, support a fast chip-to-chip interconnect. Using the Neuron Processing Pipeline capability, you can split your model and load it to local cache memory across multiple chips. The Neuron compiler uses ahead-of-time (AOT) compilation technique to analyze the input model and compile it to fit across the on-chip memory of single or multiple Inferentia chips. Doing so enables the Neuron Cores to have high-speed access to models and not require access to off-chip memory, keeping latency bounded while increasing the overall inference throughput.

## What is the difference between AWS Neuron and Amazon SageMaker Neo?

AWS Neuron is a specialized SDK for AWS Inferentia chips that optimizes the machine learning inference performance of Inferentia chips. It consists of a compiler, run-time, and profiling tools for AWS Inferentia and is required to run inference workloads on EC2 Inf1 instances. On the other hand, Amazon SageMaker Neo is a hardware agnostic service that consists of a compiler and run-time that enables developers to train machine learning models once, and run them on many different hardware platforms.  

# Compute Optimized instances

## When should I use Compute Optimized instances?

Compute Optimized instances are designed for applications that benefit from high compute power. These applications include compute-intensive applications like high-performance web servers, high-performance computing (HPC), scientific modelling, distributed analytics and machine learning inference.

## What are Amazon EC2 C6g instances?

Amazon EC2 C6g instances are the next-generation of compute-optimized instances powered by Arm-based AWS Graviton2 Processors. C6g instances deliver up to 40% better price performance over C5 instances. They are built on the AWS Nitro System, a combination of dedicated hardware and Nitro hypervisor.

## What are some of the ideal use cases for C6g instances?

C6g instances deliver significant price performance benefits for compute-intensive workloads such as high performance computing (HPC), batch processing, ad serving, video encoding, gaming, scientific modelling, distributed analytics, and CPU-based machine learning inference. Arm developers can also build their applications directly on native Arm hardware as opposed to cross-compilation or emulation.

## What are the various storage options available on C6g instances?

C6g instances are EBS-optimized by default and offer up to 19,000 Mbps of dedicated EBS bandwidth to both encrypted and unencrypted EBS volumes. C6g instances only support Non-Volatile Memory Express (NVMe) interface to access EBS storage volumes. Additionally, options with local NVMe instance storage will also be available through the C6gd instance types.

## Which network interface is supported on C6g instances?

C6g instances support ENA based Enhanced Networking. With ENA, C6g instances can deliver up to 25 Gbps of network bandwidth between instances when launched within a Placement Group.

## Can I launch C4 instances as Amazon EBS-optimized instances?

Since this feature is always enabled on C4 instances, launching a C4 instance explicitly as EBS-optimized will not affect the instance's behavior.

## How can I use the processor state control feature available on the c4.8xlarge instance?

The c4.8xlarge instance type provides the ability for an operating system to control processor C-states and P-states. This feature is currently available only on Linux instances. You may want to change C-state or P-state settings to increase processor performance consistency, reduce latency, or tune your instance for a specific workload.

## Which instances are available within Compute Optimized instances category?

- C6g instances: Amazon EC2 C6g instances are powered by Arm-based AWS Graviton2 processors. They deliver up to 40% better price performance over current generation C5 instances and are ideal for running advanced compute-intensive workloads. This includes workloads such as high performance computing (HPC), batch processing, ad serving, video encoding, gaming, scientific modelling, distributed analytics, and CPU-based machine learning inference.
- C5 instances: C5 instances are the latest generation of EC2 Compute Optimized instances. C5 instances are based on Intel Xeon Platinum processors, part of the Intel Xeon Scalable (codenamed Skylake-SP or Cascade Lake) processor family, are available in 9 sizes, and offer up to 96 vCPUs and 192 GiB memory. C5 instances deliver 25% improvement in price/performance compared to C4 instances. The C5d instances include variants that have local NVMe storage for workloads that require very low latency and storage access with high random read and write IOPS ability.
- C5a instances: C5a instances deliver leading x86 price-performance for a broad set of compute-intensive workloads including batch processing, distributed analytics, data transformations, log analysis, and web applications. C5a instances feature 2nd Gen 3.3GHz AMD EPYC processors with up to 96 vCPUs and up to 192 GiB of memory.
- C5n instances: C5n instances are ideal for applications requiring high network bandwidth and packet rate. The C5n instances are ideal for applications like HPC, data lakes, network appliances as well as applications that require inter-node communication and the Message Passing Interface (MPI). C5n offer a choice of Intel Xeon Platinum 3.0 GHz processors with up to 72 vCPUs and 192GiB of Memory.
- C4 instances: C4 instances are based on Intel Xeon E5-2666 v3 (codenamed Haswell) processors. C4 instances are available in 5 sizes and offer up to 36 vCPUs and 60 GiB memory.

## What are the storage options available to C5 customers?

C5 instances use EBS volumes for storage, are EBS-optimized by default, and offer up to 9 Gbps throughput to both encrypted and unencrypted EBS volumes. C5 instances access EBS volumes via PCI attached NVM Express (NVMe) interfaces.

## What network interface is supported on C5 instances?

C5 instances use the Elastic Network Adapter (ENA) for networking and enable Enhanced Networking by default. With ENA, C5 instances can utilize up to 25 Gbps of network bandwidth.

## How many EBS volumes can be attached to C5 instances?

C5 instances support a maximum for 27 EBS volumes for all Operating systems.

## What is the underlying hypervisor on C5 instances?

C5 instances use a new EC2 hypervisor that is based on core KVM technology.

# General Purpose instances

## What are Amazon EC2 M6g instances?

Amazon EC2 M6g instances are the next-generation of general-purpose instances powered by Arm-based AWS Graviton2 Processors. M6g instances deliver up to 40% better price/performance over M5 instances. They are built on the AWS Nitro System, a combination of dedicated hardware and Nitro hypervisor.


## What are the specifications of the new AWS Graviton2 Processors?

The AWS Graviton2 processors deliver up to 7x performance, 4x the number of compute cores, 2x larger caches, 5x faster memory, and 50% faster per core encryption performance than first generation AWS Graviton processors. Each core of the AWS Graviton2 processor is a single-threaded vCPU. These processors also offer always-on fully encrypted DRAM memory, hardware acceleration for compression workloads, dedicated engines per vCPU that double the floating-point performance for workloads such as video encoding, and instructions for int8/fp16 CPU-based machine learning inference acceleration. The CPUs are built utilizing 64-bit Arm Neoverse cores and custom silicon designed by AWS on the advanced 7 nm manufacturing technology.

## Is memory encryption supported by AWS Graviton2 processors?

AWS Graviton2 processors support always-on 256-bit memory encryption to further enhance security. Encryption keys are securely generated within the host system, do not leave the host system, and are irrecoverably destroyed when the host is rebooted or powered down. Memory encryption does not support integration with AWS KMS system and customers cannot bring their own keys.

## What are some of the ideal use cases for M6g instances?

M6g instances deliver significant performance and price performance benefits for a broad spectrum of general-purpose workloads such as application servers, gaming servers, microservices, mid-size databases, and caching fleets. Arm developers can also build their applications directly on native Arm hardware as opposed to cross-compilation or emulation.

## What are the various storage options available on M6g instances?

M6g instances are EBS-optimized by default and offer up to 19,000 Mbps of dedicated EBS bandwidth to both encrypted and unencrypted EBS volumes. M6g instances only support Non-Volatile Memory Express (NVMe) interface to access EBS storage volumes. Additionally, options with local NVMe instance storage will also be available through the M6gd instance types.

## Which network interface is supported on M6g instances?

M6g instances support ENA based Enhanced Networking. With ENA, M6g instances can deliver up to 25 Gbps of network bandwidth between instances when launched within a Placement Group.

## Will customers need to modify their applications and workloads to be able to run on the M6g instances?

