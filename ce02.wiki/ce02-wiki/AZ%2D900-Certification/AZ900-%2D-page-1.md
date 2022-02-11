Pass score 700/1000
1 hour to answer between 40-60 questions.

- **<span style="color:turquoise">Describe cloud concepts (20-25%)**
- **<span style="color:turquoise">Describe core Azure services (15-20%)**
- Describe core solutions and management tools on Azure (10-15%)
- Describe general security and network security features (10-15%)
- Describe identity, governance, privacy, and compliance features (15-20%)
- Describe Azure cost management and Service Level Agreements (10-15%)

----------------------------

# Describe Cloud Concepts (20-25%)
## Identify the benefits and considerations of using cloud services
**1.**  identify the benefits of cloud computing, such as <u>**High Availability, Scalability, Elasticity, Agility, and Disaster Recovery**</u>
- Rather than buying a new physical laptop with all the features you need (e.g 10TB of storage) which would be expensive and tedious to maintain, you can just pay for cloud services which has all the features, and the provider does all the leg work. (You pay for only the services you use.)
- The cloud offers a nearly limitless pool of raw compute, storage, and networking components to help you deliver innovative and novel user experiences quickly.
- Compute power: How much processing your computer can do. With cloud computing you can add and remove the latest
- storage: traditional pc have limited storage but clouds you can request more.
- cloud providers make sure there are back ups

High availability - cloud service always remains available. Need to ensure there is no single point of failure. 
example: if a server in US east 1 fails, the load balancer can re-route traffic to another server. This makes cloud always available
![image.png](/.attachments/image-c578541f-02bf-4a66-bf0d-485c6cfdd604.png)

Scalability - increasing your capacity. Apps in the cloud can scale vertically and horizontally:
Scaling up is increasing capacity on the same computer e.g. adding RAM or CPU. Scaling out is adding more computers of the same size. 
![image.png](/.attachments/image-4afaf0ac-4e47-47f9-8b70-70e78f70547e.png)

elasticity - atomically increase or decrease capacity based on demands. e.g. can you quickly scale up for black Friday?
NOTE: This is done with horizontal scaling and NOT with vertical scalling. Because if we increase capacity with vertical scaling, and then decrease, we may lose some data.
On Azure you use Azure VM scale sets 

Agility - Deploy and configure cloud-based resources quickly as your app requirements change.

Disaster recovery - you can deploy apps and data to regional data centers around the globe. Also back ups. So with all of this you know your data will be safe even in the event of a disaster

**2.** Identify the differences between Capital Expenditure (CapEx) and Operational Expenditure (OpEx)

- Just related to costs (business expenses) 
- CapEx is like a business buying and building its own network infrastructure. Its more expensive because there are more services to think 
- OpEx is about using cloud services and spending money on services or products now, and being billed for them now.

**3.** describe the consumption-based model

Cloud service providers operate on a consumption-based model, which means that end users only pay for the resources that they use. Whatever they use is what they pay for.

benefits:

- No upfront costs.
- No need to purchase and manage costly infrastructure that users might not use to its fullest.
The ability to pay for additional resources when they are needed.
The ability to stop paying for resources that are no longer needed.




## Describe the differences between categories of cloud services
1.  describe the shared responsibility model

2.  describe Infrastructure-as-a-Service (IaaS),
- Mostly for admins
- Azure, AWS
3.  describe Platform-as-a-Service (PaaS)
- mostly for developers
- If you want to create an app e.g. flappy bird, and you manage all the info and data. The rest of it e.g. storage space, networks are handled by the cloud.
- Easy deployment of services. 
Azure App Services provides a managed hosting environment where developers can upload their web applications, without having to worry about the physical hardware and software requirements. 
4.  describe serverless computing
5.  describe Software-as-a-Service (SaaS)
- mostly for customers. You use the product and not care how its handled, as long as it works. 
- The data, application, networks, virtual machines, everything is managed by the app. You just have to remember your log in and password.
- Gmail, Google drive, microsoft 365
- universally accessible from any platform/place. Great for collaboration. However internet may affect performance. HOWEVER, There can be some limitations to a software application, you don't have direct control of features.
6.  identify a service type based on a use case


<IMG  src="https://kinsta.com/wp-content/uploads/2020/04/responsibilities-of-cloud-service-models.png"  alt="Types of Cloud Computing — an Extensive Guide on Cloud Solutions and  Technologies in 2021"/>

## Describe the differences between types of cloud computing
1. define cloud computing
- cloud computing: using remote servers hosted on the internet rather than on your personal computer.

2. describe Public cloud
- Services are offered over the public internet and available to anyone who wants to purchase them. Cloud resources, such as servers and storage, are owned and operated by a third-party cloud service provider, and delivered over the internet.
- e.g. Lots of different companies use AWS or Azure. 

3. describe Private cloud
- A private cloud consists of computing resources used exclusively by users from one business or organization. A private cloud can be physically located at your organization's **on-site (on-premises)** datacenter, or it can be hosted by a third-party service provider.

<IMG  src="https://images.ctfassets.net/slt3lc6tev37/2jBaVWKgbOUNLDNw7QJYPh/563316b4290e2919f7510ae59a3ae3ca/public-cloud-vs-private-cloud.svg"  alt="Public Cloud vs Private Cloud"/>

4. describe Hybrid cloud
- Both on premise and using cloud services. 
- Use some services which can be found on public cloud and then move them to private.

5. compare and contrast the three types of cloud computing

- public: <span style="color:green">High scalability. Applications can be quickly provisioned and deprovisioned. Organizations pay only for what they use (cost effective). <span style="color:red">However, there are security concerns (hackers/leaks). Not customisable, 
- private: <span style="color:red">Hardware must be purchased for start-up and are responsible for hardware maintenance and updates (expensive). <span style="color:green">Organizations have complete control over resources and security. You can customise your services however you like.
- hybrid: <span style="color:green">Provides the most flexibility. Organizations determine where to run their applications. Organizations control security, compliance, or legal requirements. <span style="color:red"> Need to have a secure connection between private and public cloud. Need technical knowledge for this












-------------------

# Describe core Azure services (15-20%)

## Describe the core Azure architectural components
1. describe the benefits and usage of Regions and Region Pairs
- Region: A group of datacentres(a faciclity which holds servers) which are connected to each other. (connected with low latency)
- e.g. EU west 1, US WEST 1
- region pairs: Each region is paired with another region 300 miles away. So if one region is updated, it links with the other to ensure no downtime. 
- <span style="color:green">ensures no downtime. Good for disaster recovery

2. describe the benefits and usage of Availability Zones
- physically separate locations in a region that are tolerant to local failures.
- They are connected by a high-performance network
- To ensure resiliency, a minimum of three separate availability zones are present in all availability zone-enabled regions.
- <span style="color:green">Ensures minimal downtime ofc. But there are advantages to make use e.g. 1. zonal services, you can choose which availability zone you'd like to deploy to. 2. zone redundant

<IMG  src="https://docs.microsoft.com/en-us/azure/availability-zones/media/availability-zones.png"  alt="Image showing physically separate availability zone locations within an Azure region."/>


3. describe the benefits and usage of Resource Groups
- A folder for all resources to be in.  logical container for you to store Azure services. 
- <span style="color:green">Permissions and Governance. Tags. Cost management. Organisation e.g. lifecycle: dev, test, prod environments

4. describe the benefits and usage of Subscriptions
- A subscription provides you with authenticated and authorized access to Azure products and services. Logical entity that provides entitlement to deploy and consume Azure resources. 
- <span style="color:green">If you have multiple subscriptions, you can organize them into different invoice sections. (for different groups/projects)

5. describe the benefits and usage of Management Groups
- Management groups facilitate the hierarchical ordering of Azure resources into collections, at a level of scope above subscriptions
- <span style="color:green">Set access policies.  All subscriptions within a management group automatically inherit the conditions applied to the management group

6. describe the benefits and usage of Azure Resource Manager
- When a user sends a request from any of the available tools, the Azure Resource Manager API receives the request.
- This is the thing which governs resources. 
- <span style="color:green">unified language, whatever way you order a resource to be used, its always the same. results should be the same, no matter what method you use to access and manage Azure resources. 
- Manage your infrastructure through declarative templates rather than scripts. A Resource Manager template is a JSON file that defines what you want to deploy to Azure.

![image.png](/.attachments/image-3a967653-6338-40e4-9eb7-0a05c08c5a8a.png)

![image.png](/.attachments/image-661881d6-e7bc-40eb-be6d-729c8453065f.png)

7. explain Azure resources









## Describe core resources available in Azure
1. describe the benefits and usage of Virtual Machines, Azure App Services, Azure Container Instances (ACI), Azure Kubernetes Service (AKS), and Azure Virtual Desktop
- VM: Virtual machines are software emulations of physical computers. and you can install and run software just like a physical computer. provides infrastructure as a service (IaaS)
--Virtual machine scale sets: Azure compute resource that you can use to deploy and manage a set of identical VMs. all VMs configured the same, designed to support true autoscale.
- App service:  quickly build, deploy, and scale enterprise-grade web, mobile, and API apps running on any platform. service (PaaS) offering.
- Container instances: Similar to a VM. While it's possible to create and deploy virtual machines as application demand increases, containers are designed to allow you to respond to changes on demand. most popular container engines is Docker. don't manage the operating system for a container.
- Kubernetes Service: The task of automating, managing, and interacting with a large number of containers is known as orchestration.
- Virtual desktop:


Containers are a solution by using microservice architure. This is where you break down a task into smaller ones. e.g. break down a website between front end and backend 

2. describe the benefits and usage of Virtual Networks, VPN Gateway, Virtual Network peering, and ExpressRoute
- These connect to the cloud, for protection and monitoring, and application delivery
- Virtual Networks: enable Azure resources, such as VMs, web apps, and databases, to communicate with each other, with users on the internet, and with your on-premises client computers. Benefits: (segmentation) create multiple isolated virtual networks.
- VPN gateway: VPN gateway connects between virtual network and on-premise (your personal computer). 
![image.png](/.attachments/image-3695b5c3-47f8-4461-bcdb-41a820d72aa6.png)
- Virtual network peering: link virtual networks together by using virtual network peering.

![image.png](/.attachments/image-97c730c7-036c-4c41-a401-5194e57959cb.png)

- ExpressRoute extend your on-premises networks into the Microsoft cloud over a private connection with the help of a connectivity provider. Just something they want you to pay for, its to connect your personal laptop to things like office 365,azure. Connection doesnt go over the internet, thus more reliable. 
 Benefit: Redundant connectivity, Consistent network throughput, Access to Microsoft cloud services. Connectivity to Microsoft cloud services across all regions

 three models:
- CloudExchange colocation
- Point-to-point Ethernet connection
- Any-to-any connection
- virtual cross-connection



3. describe the benefits and usage of Container (Blob) Storage, Disk Storage, File Storage, and storage tiers

<IMG  src="https://docs.microsoft.com/en-us/learn/azure-fundamentals/azure-storage-fundamentals/media/account-container-blob-4da0ac47.png"  alt="Diagram of hierarchy of a storage account."/>

- blob storage: object storage solution for the cloud. can store massive amounts of data, BUT is unstructured (all types of files together). can be reached anywhere in the world. Azure Blob Storage is your best option for storing disaster recovery files and archives.
- Disk storage: A disk that stores data for VM. 
- File storage: Literally just a file in the cloud. you can access the files from anywhere in the world, by using a URL that points to the file.
- Storage tiers: Data stored in the cloud can be different based on how it's generated, processed, and accessed over its lifetime. Some data are just idle and sat there whilst others are very active. To accommodate this there is a pricing tier:

hot access tier: storing data that is access frequently (pics)
cool access tier: data that is infrequently accessed and stored for 30 days
archive access tier: rarely accessed data and stored for 180 days


4. describe the benefits and usage of Cosmos DB, Azure SQL Database, Azure Database for MySQL, Azure Database for PostgreSQL, and SQL Managed Instance
- Cosmos DB: full managed noSQL database. Globally accessible. This level of flexibility means that as you migrate your company's databases to Azure Cosmos DB, your developers can stick with the API that they're the most comfortable with.

- Azure SQL Database: uses PaaS. handles most of the database management functions. Microsoft handles all updates to the SQL and operating system code. You don't have to manage the underlying infrastructure.

- Azure Database for MySQL: 99.99 percent availability service level agreement. keep your app running 24/7. advantage of built-in security.

Built-in high availability with no additional cost.
Predictable performance and inclusive, pay-as-you-go pricing.
Scale as needed, within seconds.
Ability to protect sensitive data at-rest and in-motion.
Automatic backups.
Enterprise-grade security and compliance.
all are provided at no additional cost

- Azure Database for PostgreSQL: two deployment options: Single Server and Hyperscale (Citus).

- SQL Managed Instance: Azure SQL Managed Instance makes it easy to migrate your on-premises data on SQL Server to the cloud using the Azure Database Migration Service (DMS)



5. describe the benefits and usage of Azure Marketplace


https://www.youtube.com/watch?v=GDWWnGQ-rhc