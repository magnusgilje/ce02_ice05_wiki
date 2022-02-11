This file gives the generic structures of different variables which are called in terraform. They can be hard coded for specific values, but in general it is better to create a variable structure type with default values that can be changed according to specific needs, e.g. moving from the dev to test environment you may have the same variable types being called but different specific values.
### Generic variable format
```
variable "variable name" {
    type = <int, string, float etc.>
    description = "Put here a human friendly description of what this variable is for"
    default = <variable value that terraform will default to if no specific value is called in a .tfvars document>
```
### Example code
```
variable "resource_group_name"{
    type = string # the type which the variable must be, e.g. integer
    description = "This is the resource group which the storage account is in" # a human friendly description of what this variable does
    default = "rg-kubdevce02001hugiac" # this is a default value which is used if no variables are called from a *.tfvars file
}

variable "storage_account_name" {
    type = string
    description = "This is the specific storage account name being called within the resource group"
    default = "stakubdevce02001hugar02"
}

# this has been commented out as we have not used it because location is something that is called from the storage account
# variable "location" {
#     type = string
#     description = "This is the Azure location in which the storage account is located"
#     default = "North Europe"
# }

variable "cohort_no" {
    type = number
    description = "This is the cohort number that we are in for cloud engineering, e.g. CE02, we are the second cohort"
    default = 2
}

variable "env" {
    type = string
    description = "This is the environment in which you are working, e.g. dev, test, prod"
    default = "dev"
}

variable "user" {
    type = string
    description = "This is your specific ID for your person and group"
    default = "gar02"
}
```