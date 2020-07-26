# Introduction

The AWS Well-Architected Framework helps you understand the pros and cons of decisions you make while building systems on AWS. By using the Framework you will learn architectural best practices for designing and operating reliable, secure, efficient, and cost-effective systems in the cloud. It provides a way for you to consistently measure your architectures against best practices and identify areas for improvement.

AWS also provides a service for reviewing your workloads at no charge. The AWS WellArchitected Tool (AWS WA Tool) is a service in the cloud that provides a consistent process for you to review and measure your architecture using the AWS WellArchitected Framework. The AWS WA Tool provides recommendations for making your workloads more reliable, secure, efficient, and cost-effective.

AWS Well-Architected Labs, which provides you with a repository of code and documentation to give you hands-on experience implementing best practices. We also have teamed up with select AWS Partner Network (APN) Partners, who are members of the AWS Well-Architected Partner program. These APN Partners have deep AWS knowledge, and can help you review and improve your workloads.

## Definitions

The AWS Well-Architected Framework is based on five pillars — operational excellence, security, reliability, performance efficiency, and cost optimization.

| Name                   | Description                                                                                                                                                                                                            |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Operational Excellence | The ability to run and monitor systems to deliver business value and to continually improve supporting processes and procedures.                                                                                       |
| Security               | The ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.                                                                            |
| Reliability            | The ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions such as misconfigurations or transient network issues. |
| Performance Efficiency | The ability to use computing resources efficiently to meet system requirements, and to maintain that efficiency as demand changes and technologies evolve.                                                             |
| Cost Optimization      | The ability to run systems to deliver business value at the lowest price point.                                                                                                                                        |

In the AWS Well-Architected Framework we use these terms:

- A **component** is the code, configuration and AWS Resources that together deliver against a requirement. A component is often the unit of technical ownership, and is decoupled from other components.
- **Workload** to identify a set of components that together deliver business value. The workload is usually the level of detail that business and technology leaders communicate about.
- **Milestones** mark key changes in your architecture as it evolves throughout the product lifecycle (design, testing, go live, and in production).
- We think about **architecture** as being how components work together in a workload. How components communicate and interact is often the focus of architecture diagrams.
- Within an organization the **technology portfolio** is the collection of workloads that are required for the business to operate.

## On Architecture

In on-premises environments customers often have a central team for technology architecture that acts as an overlay to other product or feature teams to ensure they are following best practice. Technology architecture teams are often composed of a set of roles such as Technical Architect (infrastructure), Solutions Architect (software), Data Architect, Networking Architect, and Security Architect.

At AWS, we prefer to distribute capabilities into teams rather than having a centralized team with that capability. First, we have practices that focus on enabling each team to have that capability, and we put in place experts who ensure that teams raise the bar on the standards they need to meet. Second, we implement mechanisms that carry out automated checks to ensure standards are being met.

## General Design Principles

- **Stop guessing your capacity needs**: You can use as much or as little capacity as you need, and scale up and down automatically
- **Test systems at production scale**: You can simulate your live environment for a fraction of the cost of testing on premises.
- **Automate to make architectural experimentation easier**: Automation allows you to create and replicate your systems at low cost and avoid the expense of manual effort.
- **Allow for evolutionary architectures**: The capability to automate and test on demand lowers the risk of impact from design changes.
- **Drive architectures using data**: Your cloud infrastructure is code, so you can use that data to inform your architecture choices and improvements over time.
- **Improve through game days**: Test how your architecture and processes perform by regularly scheduling game days to simulate events in production.

# The Five Pillars of the Framework

## Operational Excellence

### Design Principles

- Perform operations as code: You can implement your operations procedures as code and automate their execution by triggering them in response to events
- Annotate documentation: In the cloud, you can automate the creation of annotated documentation after every build. Use annotations as an input to
  your operations code.
- Make frequent, small, reversible changes: Design workloads to allow components to be updated regularly.
- Refine operations procedures frequently: As you use operations procedures, look for opportunities to improve them. As you evolve your workload, evolve your AWS Well-Architected Framework procedures appropriately.
- Anticipate failure: Test your failure scenarios and validate your understanding of their impact. Test your response procedures to ensure that they are effective, and that teams are familiar with their execution.
- Learn from all operational failures: Drive improvement through lessons learned from all operational events and failures.

### Best practices

There are three best practice areas for operational excellence in the cloud:

- Prepare: Create mechanisms to validate that workloads, or changes, are ready to be moved into production and supported by operations. Operational readiness is validated through checklists to ensure a workload meets defined standards and that required AWS Well-Architected Framework procedures are adequately captured in runbooks and playbooks. Prior to transition, test responses to operational events and failures. Practice responses in supported environments through failure injection and game day events.
- Operate: Successful operation of a workload is measured by the achievement of business and customer outcomes. Define expected outcomes, determine how success will be measured, and identify the workload and operations metrics that will be used in those calculations to determine if operations are successful. Consider that operational health includes both the health of the workload and the health and success of the operations acting upon the workload. Establish baselines from which improvement or degradation of operations will be identified, collect and analyze your metrics, and then validate your understanding of operations success and how it changes over time. Use collected metrics to determine if you are satisfying customer and business needs, and identify areas for improvement. Determine the root cause of unplanned events and unexpected impacts from planned events.
- Evolve: Dedicate work cycles to making continuous incremental improvements. Regularly evaluate and prioritize opportunities for improvement. Include feedback loops within your procedures to rapidly identify areas for improvement and capture learnings from the execution of operations. Share lessons learned across teams to share the benefits of those lessons.

### Key AWS Services

The AWS service that is essential to Operational Excellence is AWS CloudFormation, which you can use to create templates based on best practices. The following services and features support the three areas in operational excellence:

- Prepare: AWS Config and AWS Config rules can be used to create standards for workloads and to determine if environments are compliant with those standards before being put into production.
- Operate: Amazon CloudWatch allows you to monitor the operational health of a workload.
- Evolve: Amazon Elasticsearch Service (Amazon ES) allows you to analyze your log data to gain actionable insights quickly and securely.

### Whitepaper

[Operational Excellence](https://d0.awsstatic.com/whitepapers/architecture/AWS-Operational-Excellence-Pillar.pdf?ref=wellarchitected-wp)

## Security

### Design principles

- Implement a strong identity foundation: Implement the principle of least privilege and enforce separation of duties with appropriate authorization for each interaction with your AWS resources. Centralize privilege management and reduce or even eliminate reliance on long-term credentials.
- Enable traceability: Monitor, alert, and audit actions and changes to your environment in real time. Integrate logs and metrics with systems to automatically respond and take action.
- Apply security at all layers: Rather than just focusing on protection of a single outer layer, apply a defense-in-depth approach with other security controls. Apply to all layers.
- Automate security best practices: Automated software-based security mechanisms improve your ability to securely scale more rapidly and cost effectively.
- Protect data in transit and at rest: Classify your data into sensitivity levels and use mechanisms, such as encryption, tokenization, and access control where appropriate.
- Keep people away from data: Create mechanisms and tools to reduce or eliminate the need for direct access or manual processing of data.
- Prepare for security events: Prepare for an incident by having an incident management process that aligns to your organizational requirements.

### Best Practices

- Identity and Access Management: are key parts of an information security program, ensuring that only authorized and authenticated users are able to access your resources, and only in a manner that you intend. You should apply granular policies, which assign permissions to a user, group, role, or resource. You also have the ability to require strong password practices, such as complexity level, avoiding re-use, and enforcing multi-factor authentication (MFA). You can use federation with your existing directory service.
- Detective Controls: identify a potential security threat or incident. They are an essential part of governance frameworks and can be used to support a quality process, a legal or compliance obligation, and for threat identification and response efforts.
- Infrastructure Protection: encompasses control methodologies, such as defense in depth, necessary to meet best practices and organizational or regulatory obligations. you can implement stateful and stateless packet inspection, either by using AWS-native technologies or by using partner products and services available through the AWS Marketplace. You should use Amazon Virtual Private Cloud (Amazon VPC) to create a private, secured, and scalable environment in which you can define your topology.
- Data Protection: You maintain full control over your data. AWS makes it easier for you to encrypt your data and manage keys, including regular key rotation, which can be easily automated by AWS or maintained by you. Detailed logging that contains important content, such as file access and changes, is available. AWS has designed storage systems for exceptional resiliency. Versioning can protect against accidental overwrites, deletes, and similar harm. AWS never initiates the movement of data between Regions.
- Incident Response: Detailed logging is available that contains important content. Events can be automatically processed and trigger tools that automate responses through the use of AWS APIs. You can pre-provision tooling and a “clean room” using AWS CloudFormation. This allows you to carry out forensics in a safe, isolated environment.

### Key AWS Services

The following services and features support the five areas in security:

- Identity and Access Management: IAM enables you to securely control access to AWS services and resources. MFA adds an additional layer of protection on user access. AWS Organizations lets you centrally manage and enforce policies for multiple AWS accounts.
- Detective Controls: AWS CloudTrail records AWS API calls, AWS Config provides a detailed inventory of your AWS resources and configuration. Amazon GuardDuty is a managed threat detection service that continuously monitors for malicious or unauthorized behavior. Amazon CloudWatch is a monitoring service for AWS resources which can trigger CloudWatch Events to automate security responses.
- Infrastructure Protection: Amazon Virtual Private Cloud (Amazon VPC), Amazon CloudFront, AWS Shield for DDoS mitigation. AWS WAF is a web application firewall that is deployed on either Amazon CloudFront or Application Load Balancer to help protect your web applications.
- Data Protection: Services such as ELB, Amazon Elastic Block Store (Amazon EBS), Amazon S3, and Amazon Relational Database Service (Amazon RDS) include encryption capabilities. Amazon Macie automatically discovers, classifies and protects sensitive data, while AWS Key Management Service (AWS KMS) makes it easy for you to create and control keys used for encryption.
- Incident Response: IAM should be used to grant appropriate authorization to incident response teams and response tools. AWS CloudFormation can be used to create a trusted environment or clean room for conducting investigations. Amazon CloudWatch Events allows you to create rules that trigger automated responses including AWS Lambda.

### Whitepaper

[Security Pillar](https://d0.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf?ref=wellarchitected-wp)

[AWS Security Overview](https://d0.awsstatic.com/whitepapers/Security/AWS%20Security%20Whitepaper.pdf?ref=wellarchitected-wp)

[AWS Security Best Practices](https://aws.amazon.com/whitepapers/aws-security-best-practices/?ref=wellarchitected-wp)

[AWS Risk and Compliance](https://d0.awsstatic.com/whitepapers/compliance/AWS_Risk_and_Compliance_Whitepaper.pdf?ref=wellarchitected-wp)

## Reliability

### Design Principles

- Test recovery procedures: In the cloud, you can test how your system fails, and you can validate your recovery procedures. This exposes failure pathways that you can test and rectify before a real failure scenario, reducing the risk of components failing that have not been tested before.
- Automatically recover from failure: By monitoring a system for key performance indicators (KPIs), you can trigger automation when a threshold is breached. This allows for automatic notification and tracking of failures, and for automated recovery processes that work around or repair the failure. It's possible to anticipate and remediate failures before they occur.
- Scale horizontally to increase aggregate system availability: Replace one large resource with multiple small resources to reduce the impact of a single failure on the overall system. Distribute requests across multiple, smaller resources to ensure that they don't share a common point of failure.
- Stop guessing capacity: you can monitor demand and system utilization, and automate the addition or removal of resources to maintain the optimal level to satisfy demand without overor under- provisioning.
- Manage change in automation: Changes to your infrastructure should be done using automation. The changes that need to be managed are changes to the automation.

### Best Practices

- Foundations: Before architecting any system, foundational requirements that influence reliability should be in place. In an on-premises environment, these requirements can cause long lead times due to dependencies and therefore must be incorporated during initial planning. AWS sets service limits (an upper limit on the number of each resource your team can request) to protect you from accidentally over-provisioning resources. You will need to have governance and processes in place to monitor and change these limits to meet your business needs.
- Change Management: Being aware of how change affects a system allows you to plan proactively, and monitoring allows you to quickly identify trends that could lead to capacity issues or SLA breaches. Using AWS, you can monitor the behavior of a system and automate the response to KPIs.
- Failure Management: In any system of reasonable complexity it is expected that failures will occur. It is generally of interest to know how to become aware of these failures, respond to them, and prevent them from happening again. Rather than trying to diagnose and fix a failed resource that is part of your production environment, you can replace it with a new one and carry out the analysis on the failed resource out of band. Regularly back up your data and test your backup files to ensure you can recover from both logical and physical errors. A key to managing failure is the frequent and automated testing of systems to cause failure, and then observe how they recover.

### Key AWS Services

The AWS service that is essential to Reliability is Amazon CloudWatch, which monitors runtime metrics. The following services and features support the three areas in reliability:

- Foundations: AWS IAM, Amazon VPC, AWS Trusted Advisor, AWS Shield.
- Change Management: : AWS CloudTrail records AWS API calls, AWS Config (inventory), Amazon Auto Scaling, Amazon CloudWatch.
- Failure Management: AWS CloudFormation, Amazon S3 (backups), Amazon Glacier provides highly durable archives, AWS KMS

### Whitepapers

[Reliability Pillar](https://d0.awsstatic.com/whitepapers/architecture/AWS-Reliability-Pillar.pdf?ref=wellarchitected-wp)

[Backup Archive and Restore Approach Using AWS](http://d0.awsstatic.com/whitepapers/Backup_Archive_and_Restore_Approaches_Using_AWS.pdf?ref=wellarchitected-wp)

[Managing your AWS Infrastructure at Scale](http://d0.awsstatic.com/whitepapers/managing-your-aws-infrastructure-at-scale.pdf?ref=wellarchitected-wp)

[AWS Disaster Recovery](http://media.amazonwebservices.com/AWS_Disaster_Recovery.pdf?ref=wellarchitected-wp)

[AWS Amazon VPC Connectivity Options](http://media.amazonwebservices.com/AWS_Amazon_VPC_Connectivity_Options.pdf?ref=wellarchitected-wp)

## Performance Efficiency

### Design Principles

- Democratize advanced technologies: Technologies that are difficult to implement can become easier to consume by pushing that knowledge and complexity into the cloud vendor's domain. Rather than having your IT team learn how to host and run a new technology, they can simply consume it as a service
- Go global in minutes: Easily deploy your system in multiple Regions around the world with just a few clicks. This allows you to provide lower latency and a better experience for your customers at minimal cost.
- Use serverless architectures: serverless architectures remove the need for you to run and maintain servers to carry out traditional compute activities. This not only removes the operational burden of managing these servers, but also can lower transactional costs because these managed services operate at cloud scale.
- Experiment more often: With virtual and automatable resources, you can quickly carry out comparative testing using different types of instances, storage, or configurations.
- Mechanical sympathy: Use the technology approach that aligns best to what you are trying to achieve.

### Best Practices

- Selection: Well-architected systems use multiple solutions and enable different features to improve performance. In AWS, resources are virtualized and are available in a number of different types and configurations. This makes it easier to find an approach that closely matches your needs, and you can also find options that are not easily achievable with on-premises infrastructure.
  - Compute: In AWS, compute is available in three forms: instances, containers, and functions:
    - Instances are virtualized servers and, therefore, you can change their capabilities with the click of a button or an API call.
    - Containers are a method of operating system virtualization that allow you to run an application and its dependencies in resource-isolated processes.
    - Functions abstract the execution environment from the code you want to execute.
  - Storage: The optimal storage solution for a particular system will vary based on the kind of access method (block, file, or object), patterns of access (random or sequential), throughput required, frequency of access (online, offline, archival), frequency of update (WORM, dynamic), and availability and durability constraints. Storage is virtualized and is available in a number of different types. This makes it easier to match your storage methods more closely with your needs, and also offers storage options that are not easily achievable with on- premises infrastructure.
  - Database: The optimal database solution for a particular system can vary based on requirements for availability, consistency, partition tolerance, latency, durability, scalability, and query capability.
  - Network: The optimal network solution for a particular system will vary based on latency, throughput requirements and so on. Physical constraints such as user or on-premises resources will drive location options, which can be offset using edge techniques or resource placement. Networking is virtualized and is available in a number of different types and configurations. This makes it easier to match your networking methods more closely with your needs.
- Review: When architecting solutions, there is a finite set of options that you can choose from. However, over time new technologies and approaches become available that could improve the performance of your architecture. Using AWS, you can take advantage of our continual innovation, which is driven by customer need.
- Monitoring: Monitoring metrics should be used to raise alarms when thresholds are breached. The alarm can trigger automated action to work around any badly performing components. Ensuring that you do not see too many false positives, or are overwhelmed with data, is key to having an effective monitoring solution. Automated triggers avoid human error and can reduce the time to fix problems.
- Tradeoffs: When you architect solutions, think about tradeoffs so you can select an optimal approach. Depending on your situation you could trade consistency, durability, and space versus time or latency to deliver higher performance.

### Key AWS Services

The AWS service that is essential to Performance Efficiency is Amazon CloudWatch. The following services and features support the four areas in performance efficiency:

- Selection:
  - Compute: Auto Scaling
  - Storage: Amazon EBS provides a wide range of storage options, Amazon S3 transfer acceleration
  - Database: Amazon RDS, Amazon DynamoDB
  - Network: Route 53, VPC, AWS Direct Connect
- Review: AWS Blog and the What's New section on the AWS website
- Monitoring: Amazon CloudWatch
- Tradeoffs: Amazon ElastiCache, Amazon CloudFront, and AWS Snowball are services that allow you to improve performance.

### Whitepapers

[Performance Efficiency Pillar](https://d0.awsstatic.com/whitepapers/architecture/AWS-Performance-Efficiency-Pillar.pdf?ref=wellarchitected-wp)

## Cost Optimization

### Design Principles

- Adopt a consumption model: Pay only for the computing resources that you require and increase or decrease usage depending on business requirements, not by using elaborate forecasting.
- Measure overall efficiency: Measure the business output of the workload and the costs associated with delivering it. Use this measure to know the gains you make from increasing output and reducing costs.
- Stop spending money on data center operations: AWS does the heavy lifting of racking, stacking, and powering servers, so you can focus on your customers and organization projects rather than on IT infrastructure.
- Analyze and attribute expenditure: The cloud makes it easier to accurately identify the usage and cost of systems, which then allows transparent attribution of IT costs to individual workload owners. This helps measure return on investment (ROI) and gives workload owners an opportunity to optimize their resources and reduce costs.
- Use managed and application level services to reduce cost of ownership: In the cloud, managed and application level services remove the operational burden of maintaining servers for tasks such as sending email or managing databases. As managed services operate at cloud scale, they can offer a lower cost per transaction or service.

### Best Practices

- Expenditure Awareness: The increased flexibility and agility that the cloud enables encourages innovation and fast-paced development and deployment. It eliminates the manual processes and time associated with provisioning on-premises infrastructure, including identifying hardware specifications, negotiating price quotations, managing purchase orders, scheduling shipments, and then deploying the resources. Accurate cost attribution allows you to know which products are truly profitable, and allows you to make more informed decisions about where to allocate budget.
- Cost-Effective Resources: Using the appropriate instances and resources for your workload is key to cost savings. You also have the opportunity to use managed services to reduce costs. AWS offers a variety of flexible and cost-effective pricing options to acquire instances from EC2 and other services in a way that best fits your needs. Appropriate service selection can also reduce usage and costs.
- Matching supply and demand: Optimally matching supply to demand delivers the lowest cost for a workload, but there also needs to be sufficient extra supply to allow for provisioning time and individual resource failures. Demand can be fixed or variable, requiring metrics and automation to ensure that management does not become a significant cost. In AWS, you can automatically provision resources to match demand. Auto Scaling and demand, buffer, and time-based approaches allow you to add and remove resources as needed.
- Optimizing Over Time: review your existing architectural decisions to ensure they continue to be the most cost-effective. As your requirements change, be aggressive in decommissioning resources, entire services, and systems that you no longer require. Managed services from AWS can significantly optimize the workload, so it is essential to be aware of new managed services and features as they become available.

### Key AWS Services

The tool that is essential to Cost Optimization is Cost Explorer. The following services and features support the four areas in cost optimization:

- Expenditure Awareness: AWS Cost Explorer allows you to view and track your usage in detail, AWS Budgets
- Cost-Effective Resources: You can use Cost Explorer for Reserved Instance recommendations, Amazon CloudWatch and Trusted Advisor to help right size your resources, Aurora on RDS to remove database licensing costs. AWS Direct Connect and Amazon CloudFront
- Matching supply and demand: Auto Scaling allows you to add or remove resources to match demand without overspending.
- Optimizing Over Time: The AWS News Blog and the What's New section on the AWS website, AWS Trusted Advisor inspects your AWS environment and finds opportunities to save you money by eliminating unused or idle resources or committing to Reserved Instance capacity.

### Whitepapers

[Cost Optimization Pillar](https://d0.awsstatic.com/whitepapers/architecture/AWS-Cost-Optimization-Pillar.pdf?ref=wellarchitected-wp)
