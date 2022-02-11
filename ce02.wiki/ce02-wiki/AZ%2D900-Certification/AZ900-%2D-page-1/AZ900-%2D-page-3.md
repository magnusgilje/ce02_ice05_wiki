Pass score 700/1000
1 hour to answer between 40-60 questions.

- Describe cloud concepts (20-25%)
- Describe core Azure services (15-20%)
- Describe core solutions and management tools on Azure (10-15%)
- Describe general security and network security features (10-15%)
- **<span style="color:turquoise">Describe identity, governance, privacy, and compliance features (15-20%)**
- **<span style="color:turquoise">Describe Azure cost management and Service Level Agreements (10-15%)**

----------------------------

# Describe identity, governance, privacy, and compliance features (15-20%)

**Describe core Azure identity services**
- explain the difference between authentication and authorization

Authen**t**ication: the process of establishing the identity of a person or service that wants to access a resource (identity).
 authori**z**ation is the process of establishing what level of access an authenticated person or service has


- define Azure Active Directory
 Azure AD motintors sign-in attempts. 
Active directory - provides an identity and access management service 
Azure active directory - same as above but cloud based

- describe the functionality and usage of Azure Active Directory

Use Azure AD Connect to connect between Active directory and Azure Active directory. Those two are slightly different.
Active directory 
azure AD can protect off premise devices, and will tell you if other devices have signed in. 
Azure AD helps users access both external and internal resources.

- describe the functionality and usage of Conditional Access, Multi-Factor Authentication (MFA), and Single Sign-On (SSO)

Conditional Access - allow or deny based on signals. Dont need further authentication if your in a known location but will need it if ur in a different location. 
Conditional Access enables you to require users to access your applications only from approved, or managed, devices.

Multi-Factor Authentication -  More than one type of signing in identifcation

SSO - With SSO, you need to remember only one ID and one password. This is for multiple devices

**Describe Azure governance features**
- describe the functionality and usage of Role-Based Access Control (RBAC)

This is just managing scope. e.g. be a reader only, be the owner 

![image.png](/.attachments/image-343e4b04-85a4-4053-92ce-53290a08d2e4.png)

- describe the functionality and usage of resource locks

A resource lock prevents resources from being accidentally deleted or changed.

- describe the functionality and usage of tags

tags are another way to organize resources

- describe the functionality and usage of Azure Policy

Azure Policy is a service in Azure that enables you to create, assign, and manage policies that control or audit your resources.

- describe the functionality and usage of Azure Blueprints

you can define a repeatable set of governance tools and standard Azure resources that your organization requires.

**Describe privacy and compliance resources**
- describe the Microsoft core tenets of Security, Privacy, and Compliance



- describe the purpose of the Microsoft Privacy Statement, Online Services Terms (OST) and Data Protection Amendment (DPA)


1. The Microsoft Privacy Statement provides details about the personal data Microsoft processes and how the company processes it.
2. The Online Services Terms is a legal agreement between Microsoft and the customer that details the obligations by both parties. For all microsoft services
3. Data Protection Amendment - an obligation, legal document. Obligations for both parties. 


- describe the purpose of the Trust Center

1. just a website 
2. for anyone
3. you can check all the policies here, even regional ones
4. Check policies for all products


- describe the purpose of the Azure compliance documentation

1. compliance only for azure and not all Microsoft services

Microsoft compliance offerings help your organization comply with national, regional, and industry-specific requirements governing the collection and use of data.

- describe the purpose of Azure Sovereign Regions (Azure Government cloud services and Azure China cloud services)




------------------

# Describe Azure cost management and Service Level Agreements (10-15%)


**Describe methods for planning and managing costs**
- identify factors that can affect costs (resource types, services, locations, ingress and egress traffic)

resources type - hot or cold or archive storage. storage account can be block blob storage or table storage. 

different regions have different prices


- identify factors that can reduce costs (reserved instances, reserved capacity, hybrid use benefit, spot pricing)

Azure Advisor identifies unused or underutilized resources and recommends unused resources that you can remove.

- describe the functionality and usage of the Pricing calculator and the Total Cost of Ownership (TCO) calculator

pricing calculator - which azure service best fit your requirements 

Total cost of ownership calculator - helps you estimate the cost savings of operating your solution on Azure over time, instead of in your on-premises datacenter
workload - the actual things e.g. storage, 
assumptions - electricity, water, it wages

- describe the functionality and usage of Azure Cost Management

Azure Cost Management + Billing is a free service that helps you understand your Azure bill

azure subscriptions include:
- free trial
- pay as you go 
- members

**Describe Azure Service Level Agreements (SLAs) and service lifecycles**
- describe the purpose of an Azure Service Level Agreement (SLA)

Just another agreement between service and customer. 
Provides you with what standards youll get with the service e.g. downtime, uptime (if its up 24/7), any credit if theres downtime
never 100%, but 99%, 99.99%

You don't need an Azure subscription to review service SLAs.

- identify actions that can impact an SLA (i.e. Availability Zones)

If one availability zone is affected, your virtual machine instance in the other availability zone should be unaffected.

Azure status provides a global view of the health of Azure services and regions

- describe the service lifecycle in Azure (Public Preview and General Availability)

To ensure high availability, you might plan for your application to have duplicate components across several regions, known as redundancy. Conversely, to minimize costs during non-critical periods, you might run your application only in a single region. 
