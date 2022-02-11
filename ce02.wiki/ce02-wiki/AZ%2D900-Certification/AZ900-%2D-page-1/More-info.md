- DDoS attack disrupts normal working of a website by flooding it with a surge of internet traffic. 

comes in basic and standard

basic: always enables for free. 
standard: a bonus is being able to do virtual networks
DDOS can work on multiple subscriptions

- Even if you delete the VM, you still pay for the storage costs.
You are always charged for the Os (OPERATING SYSTEM) disk attached to the virtual machine. Even if the vm is stoppped
When the machine is in the Stopped (Deallocated) state, the compute costs are no longer charged to the customer.
You are only charged for the Static Public IP addresses and not for the private IP addresses.

![image.png](/.attachments/image-8d4e03a7-9d44-48e6-86f5-1ef620f02306.png)



- Azure Policy is a service in Azure that enables you to create, assign, and manage policies that control or audit your resources.
Azure Policy evaluates your resources and highlights resources that aren't compliant with the policies you've created.
e.g.  Azure Policy that restricts the deployment of Azure resources to a specific location.
Recall that you can assign a policy to a management group, a single subscription, or a resource group. Here, you assign the policy to a resource group so that policy doesn't affect any other resources in your Azure subscription.

- network security group - Filter internet in a network. A network security group contains security rules that allow or deny inbound network traffic to, or outbound network traffic

<script>Alert('crossscript')</script>

![image.png](/.attachments/image-1a447c98-9983-4abd-be20-bd9cec267945.png)

- Application security group - same thing as NSG but you choose specific applications 
 ![image.png](/.attachments/image-44812b28-6965-4606-83bf-788d468a26e7.png)

- UDR - user defined route - can change the way traffic is routed e.g. between one subnet and another 

- Azure cosmos DB: Azure Cosmos DB is a fully managed NoSQL database service for modern app development.

- Azure security centre - Azure Security Center is a monitoring service and checking security that provides visibility of your security posture across all of your services, both on Azure and on-premises.


- Azure sentinel - Make your threat detection and response smarter and faster with artificial intelligence (AI). A SIEM aggregates security data from many different sources to provide additional capabilities for threat detection and responding to threats.

- initiative definition - group policies together into one. 

Your security posture is your organization's ability to protect from and respond to security threats. 

A firewall is a network security device that monitors incoming and outgoing network traffic and decides whether to allow or block specific traffic based on a defined set of security rules. You can create firewall rules that specify ranges of IP addresses. Only clients granted IP addresses from within those ranges are allowed to access

The perimeter layer is about protecting your organization's resources from network-based attacks. 

Azure Dedicated Host provides dedicated physical servers to host your Azure VMs for Windows and Linux.

Azure Machine Learning - u build your own model to analyse complex data. for predictions

Azure Cognitive Services - Azure Cognitive Services, for the most part, provides pretrained models so that you can bring in your live data to get predictions on.
good for regnising text, image, voice, and non tech ppl. this gives a prebuilt model

Azure Bot Service - is a virtual agent bot

serverless - managed for you.  is a cloud-hosted execution environment that runs your code but abstracts the underlying hosting environment.

logic apps - Azure Logic Apps is designed in a web-based designer and can execute logic that's triggered by Azure services without writing any code. 

azure functions - Azure Functions scales automatically, and charges accrue only when a function is triggered.
Executing 

Azure Test Labs is used to create automated tests, but not to manage VMs to test across various environments. But Azure DevTest lab can manage VM's


Azure Synapse Analytics:

HDInsight:

Azure Databricks:

- imperative - writing each individual step out to get the actin you want 

- declarative - writing out only the desired outcome 

- ARM: azure resource manager TEMPLATES! These are templates which contain scripts that main need to connect with each other. They can also be deployed in a specific order. THIS IS WRITTEN IN JSON
![image.png](/.attachments/image-7a9a5ab3-7fdd-4d47-aeef-23d5166d11bd.png)


- Azure powershell: professionals can execute commands called cmdlets, These commands call the Azure Rest API to perform every possible management task in Azure. Cmdlets can be executed independently or combined into a script file and executed together to orchestrate.
Azure PowerShell is available for Windows, Linux, and Mac, and you can access it in a web browser via Azure Cloud Shell. This is written in powershell 


- Azure CLI: professional can execute commands in Bash. Both run on Windows, Linux, and Mac, and can be accessed in a web browser via Cloud Shell. literally the same as azure powershell but you can write it in bash

- Azure CLI and powershell are more so for one off actions. However ARM is more for orchestration and you can combine both cli and powershell in them. Also for ARM, you can keep the scripts for later to run.
- Azure portal can do all the stuff you need but its just less effective.
- but azur powershell is more for windows, and cli is more for linux


azure sentinel vs security center
security centre - Security Center, on the other hand, is focused on completing compliance checklists

Azure service health - mostly for service issues, or planned manaitinaed of azure

azure monitor - collecting, analyzing, visualizing, and potentially taking action based on the metric and logging data from your entire Azure and on-premises environment. if you want to keep track of the performance or issues related to your specific VM or container instances, databases, your applications, and so on, you want to visit Azure Monitor and create reports and notifications. Azure Monitor to set up alerts. BUT NOT FOR NEW RECOMMENDATIONS
Azure Monitor is the platform used by Application Insights.

azure advisor - makes recommendations to help improve reliability, security, and performance, achieve operational excellence, and reduce costs. 
can do alert for new recommendations




 Azure AD can detect sign-in attempts from unexpected locations or unknown devices.

 connect your existing Active Directory installation with Azure AD. You can use Azure AD Connect.


Single sign-on is an authentication method that allows users to sign in using one set of credentials to multiple independent software systems. Using SSO means a user doesn't have to sign in to every application they use. SSO enables a user to remember only one ID and one password to access multiple applications.


Conditional Access enables you to require users to access your applications only from approved, or managed, devices.



Azure role-based access control (Azure RBAC) is the authorization system you use to manage access to Azure resources. Access control (IAM) is the page that you typically use to assign roles to grant access to Azure resources


resource locks - Think of a resource lock as a warning system that reminds you that a resource should not be deleted or changed.


CanNotDelete means authorized people can still read and modify a resource, but they can't delete the resource without first removing the lock.
ReadOnly means authorized people can read a resource, but they can't delete or change the resource. Applying this lock is like restricting all authorized users to the permissions granted by the Reader role in Azure RBAC.


Azure Blueprints enables you to define the set of standard Azure resources that your organization requires. Each component in the blueprint definition is known as an artifact.

The Cloud Adoption Framework for Azure provides you with proven guidance to help with your cloud adoption journey. Just for strategy e.g. like software developemnt model


The Online Services Terms (OST) is a legal agreement between Microsoft and the customer