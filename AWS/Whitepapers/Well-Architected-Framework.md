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
- Annotate documentation:
