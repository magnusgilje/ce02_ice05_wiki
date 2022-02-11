This is a generic file which tells you what providers you are using and their versions. For example, to run terraform for the Azure Research Manager you must call the provider for the Azure Research Manager and the version number that is being used

```
terraform {
  required_providers {
    local = {
      version = "2.1.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm" #azure resource manager
      version = "2.83.0"
    }

    azuread = {
      source  = "hashicorp/azuread" #azure active directory
      version = "2.8.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = false
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

```