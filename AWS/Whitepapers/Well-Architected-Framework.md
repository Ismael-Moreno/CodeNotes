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
