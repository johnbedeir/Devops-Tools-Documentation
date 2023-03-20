#
# DevOps Interview Questions
## Question 1:
### Docker vs Vagrant
```
Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation
Docker Containers are generally more lightweight than virtual machines, so starting and stopping containers is extremely fast. 
Both Vagrant and Docker have a vast library of community-contributed "images" or "boxes" to choose from.
```
## Question 2:
### What is SAAS, PAAS & IAAS stand for?
```
SAAS: Software as a Service, also known as cloud application services, SaaS utilizes the internet to deliver applications, which are managed by a third-party vendor, to its users. A majority of SaaS applications run directly through your web browser, which means they do not require any downloads or installations on the client side.

PAAS: Cloud platform services, also known as Platform as a Service, PaaS delivers a framework for developers that they can build upon and use to create customized applications. All servers, storage, and networking can be managed by the enterprise or a third-party provider while the developers can maintain management of the applications.

IAAS: Cloud infrastructure services, known as Infrastructure as a Service, Cloud infrastructure services, known as Infrastructure as a Service 
```
## Question 3:
### What is VPC?
```
VPC is Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.
```
## Question 4:
### What is IAC?
[Watch explaination here](https://www.youtube.com/watch?v=zF_N4flz8lw)
```
IAC is Infrastructure as Code which is managing and provisioning of infrastructure through code instead of through manual processes.
```

## Question 5:
### Cloud Regions vs Availability Zones?
```
Amazon EC2 is hosted in multiple locations world-wide. These locations are composed of Regions, Availability Zones, Local Zones, AWS Outposts, and Wavelength Zones. Each Region is a separate geographic area. 
The Availability Zones are multiple, isolated locations within each Region.
```
## Question 6:
### What is EKS?
[Watch explaination here](https://www.youtube.com/watch?v=4Tkxe0VjrYw)
```
EKS is Amazon Elastic Kubernetes Service whcih is a managed Kubernetes service that makes it easy for you to run Kubernetes on AWS.
```
## Question 7:
### What is ECR?
```
ECR is Amazon Elastic Container Registry which is an AWS managed container image registry service that is secure, scalable, and reliable. Amazon ECR supports private repositories with resource-based permissions using AWS IAM.
```
## Question 8:
### Pods vs Deployments?
```
The pod is the smallest unit of Kubernetes used to house one or more containers and run applications in a cluster, while deployment is a tool that manages the performance of a pod and start it when it is down.
```
## Question 9:
### What is Cloud Formation?
```
AWS CloudFormation is a service that gives developers and businesses an easy way to create a collection of related AWS and third-party resources, and provision and manage them in an orderly and predictable fashion.
```
## Question 10:
### Horizontal Scaling vs Vertical Scaling?
[Watch explaination here](https://www.youtube.com/watch?v=YfJZBngbhM8&t=744s)
```
While horizontal scaling refers to adding additional nodes, vertical scaling describes adding more power to your current machines.
```
## Question 11:
### What Kubectl is used for?
[Watch explaination here](https://www.youtube.com/watch?v=kV4jINv3s-k)
```
Kubectl is the Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs. For more information including a complete list of kubectl operations.
```
## Question 12:
### Monolithic vs Microservices?
[Watch explaination here go to min 00:24](https://www.youtube.com/watch?v=YfJZBngbhM8&t=20s)
```
A monolithic application is built as a single unit, normally, monolithic applications have one large code base and lack modularity. If developers want to update or change something, they access the same code base. So, they make changes in the whole stack at once.
While a monolithic application is a single unified unit, a microservices architecture breaks it down into a collection of smaller independent units. These units carry out every application process as a separate service. So all the services have their own logic
```
## Question 13:
### What is LoadBalancer?
[Watch explaination here go to min 2:23](https://www.youtube.com/watch?v=4Tkxe0VjrYw)
```
Load balancing refers to efficiently distributing incoming network traffic across a group of backend servers, also known as a server farm or server pool.
```
## Question 14:
### What is Elasticity?
[Watch explaination here go to min 00:34](https://www.youtube.com/watch?v=kV4jINv3s-k&t=4s)
```
The Elasticity refers to the ability of a cloud to automatically expand or compress the infrastructural resources on a sudden-up and down in the requirement so that the workload can be managed efficiently. This elasticity helps to minimize infrastructural cost.
```
## Question 15:
### What is Target groups?
```
Each target group is used to route requests to one or more registered targets. When you create each listener rule, you specify a target group and conditions. When a rule condition is met, traffic is forwarded to the corresponding target group. You can create different target groups for different types of requests. For example, create one target group for general requests and other target groups for requests to the microservices for your application.s
```
## Question 16:
### What High Availability means?
[Watch explaination here go to min 1:18](https://www.youtube.com/watch?v=kV4jINv3s-k)
```
High availability is the ability of a system to operate continuously without failing for a designated period of time the minimum number of nodes to acheive the High availability is 3 nodes

```
## Question 17:
### Master node vs Worker node?
[Watch explaination here go to min 6:19](https://www.youtube.com/watch?v=YfJZBngbhM8)
```
The master node is responsible for running several Kubernetes processes it contains (API Server, Controller manager, Scheduler and etcd)
The worker nodes are the part of the Kubernetes clusters which actually execute the containers and applications on them. They have two main components, the Kubelet Service and the Kube-proxy Service.

```
## Question 18: (Kubernetes Questions)
### What is Kubernetes and how does it work?
```
Kubernetes is an open-source platform that automates the deployment, scaling, and management of containerized applications. It works by creating a cluster of worker nodes that can run containerized applications, and managing those nodes and applications through a central control plane.

```
## Question 19:
### Can you explain the difference between a pod and a deployment in Kubernetes?
```
A pod is the smallest deployable unit in Kubernetes, consisting of one or more containers that share the same network and storage resources. A deployment is a higher-level abstraction that manages a set of replica pods, ensuring that the desired number of replicas are running and that they are updated and rolled out gracefully.

```
## Question 20:
### How do you scale a deployment in Kubernetes?
```
You can scale a deployment in Kubernetes by updating its replica count using the kubectl scale command or by modifying its YAML configuration file and applying the changes using kubectl apply.

```
## Question 21:
### How do you monitor and troubleshoot a Kubernetes cluster?
```
You can monitor and troubleshoot a Kubernetes cluster using various tools and techniques, including logging and metrics collection, tracing, and debugging. Common tools for monitoring and troubleshooting Kubernetes include Prometheus, Grafana, Jaeger, and kubectl commands like kubectl logs and kubectl exec.

```
## Question 22:
### What is a service in Kubernetes and why is it needed?
```
A service in Kubernetes is an abstract way to expose an application running on a set of pods as a network service. It provides a stable IP address and DNS name for the pods, and allows other applications to access the service through a consistent endpoint.

```
## Question 23:
### How do you deploy a containerized application to Kubernetes?
```
To deploy a containerized application to Kubernetes, you need to create a Kubernetes deployment or a pod YAML configuration file that describes the application's container image, resource requirements, and other settings. You can then apply the configuration using kubectl apply or create commands.

```
## Question 24:
### What are the different types of Kubernetes volumes and when would you use each type?
```
There are several types of Kubernetes volumes, including hostPath, emptyDir, configMap, secret, persistentVolumeClaim, and more. Each type is designed to support different use cases and storage requirements, such as temporary storage, shared configuration, or persistent data storage.

```
## Question 25:
### What is a Kubernetes ConfigMap and how would you use it?
```
A ConfigMap is a Kubernetes object that provides a way to store configuration data as key-value pairs that can be consumed by containers running in a pod. You can use a ConfigMap to store environment variables, command-line arguments, and other configuration options.

```
## Question 26:
### Can you explain the concept of a Kubernetes namespace?
```
A namespace is a way to partition a Kubernetes cluster into multiple virtual clusters. It provides a way to group related objects together and to provide isolation between different parts of your application. You can use namespaces to limit resource usage, provide access control, and simplify management of your Kubernetes cluster.

```
## Question 27:
### How do you perform a rolling update of a Kubernetes deployment?
```
You can perform a rolling update of a Kubernetes deployment by updating the deployment manifest file with the new container image or configuration options and then using kubectl apply to apply the changes. Kubernetes will automatically roll out the update to the pods in the deployment, one at a time, while keeping the application available to users.

```