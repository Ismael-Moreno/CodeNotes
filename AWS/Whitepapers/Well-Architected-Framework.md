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