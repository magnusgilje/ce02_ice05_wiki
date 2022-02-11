# This is an walkthrough of set of terraform files for creating a hugo storage account.

Code is shown in **bold**, comments are shown in _italics_.

If you want to copy and paste stuff, you can get it directly from my repo:
**https://dev.azure.com/kubrick-training/ce02/_git/terraformhugostorage_tom04**

-------------------------------
## Main.tf

_Blocks that start with "data" mean that we need to read them in from somewhere else, but as read-only_
_Think of it kinda like "import" in python_

_The first resource group I'm pulling in is the one which we want to write our storage account to_
_Rather than hard coding this, I've put it in as a variable (var.), which can be found in the common.tfvars file_

**data "azurerm_resource_group" "deploy" {**
  **name = var.resource_group_name**
**}**

_The next "data" object that I'm importing is azuread_group. AKA "the groups we've been put into in azure"_
_https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group_

_You can see what groups you're in on the azure active directory:_
_https://portal.azure.com/#blade/Microsoft_AAD_IAM/GroupsManagementMenuBlade/AllGroups_
_Azure active directory is basically a big database of users and groups_

**data "azuread_group" "aad_users" {**
  **display_name = local.local_users_group_name**
**}**

_Locals are temporary local variable that we set up when we run terraform._
_Means we can use a short name "local.cohort_id" for example rather than the big long format("blah blah")_
_https://www.terraform.io/docs/language/values/locals.html_

**locals {**

_First local is only used for the group that we've been put into in azure:

  **local_users_group_name = format("ce%02d Project Users", var.cohort)**

_Next local for cohort_id uses the format function:_
_https://www.terraform.io/docs/language/functions/format.html_

_Basically all it is saying is "ce" + "I want 2 zeros as placeholders and then if i have a variable called cohort replace the zeros using it"_
_So here, my cohort_id becomes ce02_

  **cohort_id              = format("ce%02d", var.cohort)**

_sa_name is my local for "storage account name". It takes env and cloudid variables from my variables.tf file (which are given in common.tfvars)_
_You need to run the command terraform plan -var-file=common.tfvars if you want to use this file (and save you manually putting in the variables each time)_

  **sa_name                = format("stakub%s%s001hu%s", var.env, local.cohort_id, var.cloudid)**

_The final local is a map of my tags. It's like a dictionary in python with key value pairs._

  **default_tags = tomap({**
    **"cohort"  = local.cohort_id,**
    **"cloud"   = "azure",**
    **"pod"     = "tomato",**
    **"env"     = var.env,**
    **"purpose" = "hugo_demo"**
    **}**
  **)**
**}**

_This next block is the meat of the code. "resource" means that I want to create something new._
_https://www.terraform.io/docs/language/resources/syntax.html_
_"azurerm_storage_account" means a storage account. "site" is what I want to call it_

**resource "azurerm_storage_account" "site" {**


_If you google "azurerm_storage_account" you get info about which of these arguments are optional, and which are needed:_
_https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_
_The reason why some of these take the "data" prefix, is because that's the where it came from (read only object)_
_These ones are required arguments, telling you the most important info about your new storage account._

  **resource_group_name      = data.azurerm_resource_group.deploy.name**
  **location                 = data.azurerm_resource_group.deploy.location**
  **account_tier             = "Standard"**
  **account_replication_type = "LRS"**
  **name                     = local.sa_name**

_These are optional arguments that add functionality to your storage account (e.g. I want it to host a website)_

  **account_kind             = "StorageV2"**
  **static_website {**
    **index_document     = "index.html"**
    **error_404_document = "404.html"**
  **}**
_Here's where I call my tags local variable (stored as a map)_

  **tags = local.default_tags**
**}**

_The code above this point will work fine on its own. Now I want to add some permissions for my storage account._
_Basically: Who is going to get full access to this storage account? "CE02_users"_

**resource "azurerm_role_assignment" "data_owner" {**
  **scope                = azurerm_storage_account.site.id**

_This is the name of my role. Azure make up the rubbish names like this:_

  **role_definition_name = "Storage Blob Data Owner"**

_And this is the person/group who gets it (the ce02_users group on azure)_

  **principal_id         = data.azuread_group.aad_users.object_id**
  **depends_on = [**
    **azurerm_storage_account.site**
  **]**
**}**

_Once the storage account is built, you can check out these permissions in the IAM tab for the storage account on portal.azure.com_

_So we've set up our "blob data owners", now we can set up another more basic role._
_These guys are allowed to " to list and regenerate keys on Storage Accounts" whatever that means._

**resource "azurerm_role_assignment" "data_key_service_role" {**
  **scope                = azurerm_storage_account.site.id**
  **role_definition_name = "Storage Account Key Operator Service Role"**

_But we use the same group as before. So CE02 are set to both "blob data owners" and "key operators"._
_Seems redundant but I won't question Martin's ways._

  **principal_id         = data.azuread_group.aad_users.object_id**
  **depends_on = [**
    **azurerm_storage_account.site**
  **]**
}

_Now we have created a storage account with certain groups able to do certain things._
_Martin likes logging, so lets add logging._

_This first data block is used to pull in the resource group that the log analytics workspace "lace02hub"_
_Lace02hub has been set up by Martin to provide a central space where we can all aim our logging._
_It allows us to use Azure's dashboards / logging tools to visualise how people are using the stuff we build._

**data "azurerm_resource_group" "analytics" {**
  **name = "rg-ce02-hub"**
**}**

_I've defined our resource group that Lace02hub sits in, now I need to import Lace02hub itself:_
_The "azure_rm_log_analytics_workspace" is a string that tells azure that I want to import a log analytics platform_
_The "analytics" in the second set of quotes is what I've decided to name it._
_It takes the "resource_group_name" argument, so I need to tell it where to find it (see above)_

**data "azurerm_log_analytics_workspace" "analytics" {**
  **name                = "lace02hub"**
  **resource_group_name = data.azurerm_resource_group.analytics.name**
**}**

_Next I'm pulling in the "azurerm_monitor_diagnostic_categories"._
_The point of this is that say Microsoft release a new type of metric. I want to have it by default (no hardcoding)_

**data "azurerm_monitor_diagnostic_categories" "storage" {**
  **resource_id = azurerm_storage_account.site.id**
**}**

_Now we get to writing our diagnostic (logging) settings. (see the "resource" at the front)_

**resource "azurerm_monitor_diagnostic_setting" "storage" {**

_I want to call these settings "tom04_diagnostics"_

  **name                       = "tom04_diagnostics"**

_It applies to my newly made storage account_

  **target_resource_id         = azurerm_storage_account.site.id**

_And it fires the logs and metrics into my Lace02hub workspace (set up by Martin)._

  **log_analytics_workspace_id = data.azurerm_log_analytics_workspace.analytics.id**

_Here the syntax gets confusing. _
_The most important concept is "for_each", which works like a "for" loop in python, but looks much more ugly._
_https://www.terraform.io/docs/language/meta-arguments/for_each.html_

  **dynamic "metric" {**

_We look through all of the metrics that microsoft has made_
    **iterator = metric_category**
    **for_each = data.azurerm_monitor_diagnostic_categories.storage.metrics**

_And we write them into our settings on our storage account, making sure they're "enabled"_
    **content {**
    **category = metric_category.value**
      **enabled  = true**


_We want the logs to delete themselves, so they don't take up loads of space, so we set this too._
_I set the logs to delete in 7 days in the common.tfvars file_
      **retention_policy {**
        **enabled = true**
        **days    = var.log_retention_days**
      **}**
    **}**
  **}**
**}**

---------------------
## Variables.tf

_It's common to split up tf files into smaller chunks, to make it easier to read. Here I've put my variables in a separate file._

_These 3 variables are used to define my tags, and to name my storage account correctly_

**variable "env" {**
  **type = string**
**}**

**variable "cloudid" {**
  **type    = string**
  **default = "tom04"**
**}**

**variable "cohort" {**
  **type = number**
**}**

_This is the name of the resource group that the storage account is going to be created in_

**variable "resource_group_name" {**
  **type        = string**
  **description = "Target resource group for deployment"**
**}**

_As we are setting up diagnostic settings, we need to define how long we want the logs to last_

**variable "log_retention_days" {**
  **type = number**
**}**

-----------
## Providers.tf

_The only "provider" i need is azurerm. Terraform relies on plugins called "providers" to interact with cloud providers._
_https://www.terraform.io/docs/language/providers/index.html_

**provider "azurerm" {**
  **features {**
    **key_vault {**
      **purge_soft_delete_on_destroy = true**
    **}**
  **}**
**}**

--------
## Outputs.tf

_Outputs are totally optional. They work like print() in python._
_It means that when I've finished my terraform apply, I get a print message explaining what I've made and what is the URL_

**output "id" {**
  **value       = azurerm_storage_account.site.id**
  **description = "The ID of the Storage Account"**
**}**

**output "endpoint" {**
  **value       = azurerm_storage_account.site.primary_web_endpoint**
  **description = "The endpoint URL for web storage"**
**}**

-------
## Common.tfvars

_These 3 variables are used to define my tags, and to name my storage account correctly_

**env                 = "dev"**
**cloudid             = "tom04"**
**cohort              = 2**

_This is the name of the resource group that the storage account is going to be created in_

**resource_group_name = "rg-kubdevce02001hugiac"**

_When we are setting up diagnostic settings, we need to define how long we want the logs to last_

**log_retention_days  = 7**

---------------------

_Done._
_We have got a storage account, that ce02_users have permission to use, that auto sends logging/metrics to lace02hub._
_Message me if you need anything - Mike_
