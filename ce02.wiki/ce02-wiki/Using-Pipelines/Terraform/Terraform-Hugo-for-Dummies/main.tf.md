this is our main file, at the end the processing this file should be as empty as possible so that it is readable. It should contain only the building blocks needed to run and anything that needs to be called to run, e.g. a variable, should be put in a different file as such this should be a very generic file that can be used to run over different specific variables that can then be called according to your needs.

note: to make life easier it is best, at this stage at least, start writing in main first then work out what the specifics are needed for this function. Once you have what you need to run THEN you can start to add the variables that you need to your variable files and then move the code out of the main file

For this folder we are creating a storage account which is which can be used to (eventually) to deploy a hugo website and run through an Azure pipeline at three stages to make sure that the website is functional on different cloud platforms and there are no bugs. The first thing you need to do to get this working is to get your resources.

The first thing is to get the resource group that the storage account will be in. This is a date because it's something that we are calling and already exists data naming convention: data "function name" (this comes from the terraform manual) "our name"{ blah blah blah }

```
data "azurerm_resource_group" "hugo_iac_rg" { #we are calling our function hugo_iac_rg as it is for hugo, iac=infrastrucute as code, and rg is resource group
    name = var.resource_group_name  # for this it is "rg-kubdevce02001hugiac", this will not change for this but may be a different group in the future
}

## we need to access the active directory which is the groups that you are a part of in Azure - it is essentially a database of users and groups. 
## For this display_name is the required variabe

data "azuread_group" "aad_users" { # we are calling our function Azure Active Directory Users
    display_name =  local.cohort_name 
}

resource "azurerm_storage_account" "hugo_iac_sa" {
    name = local.sa_name
    resource_group_name = data.azurerm_resource_group.hugo_iac_rg.name 
    #data. as we are calling from a data structure, then the generic function name, specific function name, and the value "name" within that
    location = data.azurerm_resource_group.hugo_iac_rg.location
    account_tier = "Standard" # subscription pricing tier
    account_replication_type = "LRS" # this is to do with redundancies, this is how you replicate your account if the servers go down

}
```
