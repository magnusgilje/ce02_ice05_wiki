#</u>A guide and explanation for things on the Azure Portal</u>

Azure management hierarchy: 

<IMG  src="https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/media/organize-resources/scope-levels.png"  alt="Organize your Azure resources effectively - Cloud Adoption Framework |  Microsoft Docs"/>


# Subscriptions 



# Resource Groups 
- Logical containers where you can deploy and manage Azure resources like web apps, databases, and storage accounts.
- Names begin with rg which stands for resource group

![image.png](/.attachments/image-6ddf7dda-ed42-4ab9-9729-0b1efbacfae6.png)

Look how theres a resource group called `rg-kubdevce02001planet`, This is like a folder which contained all our work for when we did that terraform exercise. 

To use a service within that resource group, first press the resource group you want to put your work into and then press create. e.g. I clicked `rg-kubdevce02001planet` and then create. (YES, I KNOW FOR THIS PARTICULAR RESOURCE GROUP EXCERISE WE WERE USING TERRAFORM SO THAT WE DIDNT NEED TO DO THIS MANUALLY BUT HUSH)

![image.png](/.attachments/image-b94a337e-a824-48e7-92fe-d6dec9770e0b.png)
Here you can add whatever service you want to the resource group, e.g want a storage account? OkAY! Want a key vault! OFCOURSE

![image.png](/.attachments/image-bf0ddb36-9489-4f0e-b893-bdca94fc20b9.png)

# Resources 
- These are services we've been using 
- Key vaults, Virtual machines, SQL databases

To create a resource you can go into your resource group above and do those steps.

#Virtual machines

# Key Vaults  
- These can store Keys, Secrets and Certificates
- You need to give yourself access in the access policies (left hand bar). (Or else you won't see those secrets oop)
- 

To create a key:
![image.png](/.attachments/image-f218a26a-7698-4589-b49a-ae71631bb74d.png)





- **Azure Active Directory (Azure AD)**: The Microsoft cloud-based identity and access management service. Azure AD allows your employees to sign in and access resources.
- **Azure AD tenant**: A dedicated and trusted instance of Azure AD. An Azure AD tenant is automatically created when your organization first signs up for a Microsoft cloud service subscription like Microsoft Azure, Intune, or Microsoft 365. An Azure tenant represents a single organization.
- **Azure AD directory**: Each Azure AD tenant has a single, dedicated, and trusted directory. The directory includes the tenant's users, groups, and applications. The directory is used to perform identity and access management functions for tenant resources. A directory can be associated with multiple subscriptions, but each subscription is associated with only one directory.


 