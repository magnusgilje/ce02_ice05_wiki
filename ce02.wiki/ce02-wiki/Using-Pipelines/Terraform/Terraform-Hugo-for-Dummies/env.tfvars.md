## File purpose

.tf files are just generic terraform files. Within a folder they can essentially be treated as one file that is called automatically together when you run terraform. .tfvars files do not run automatically, but instead must be explicitly called (e.g. using -var-file=env.tfvars) to call any variables which you may want to use. 

You may have different .tfvars files for different environments when this causes variable names to change. For example, the storage account includes the environment type in its name and so you can have different .tfvars files for development, testing, and production which then define the environment as dev, test, and prod respectively. NB: there may be overlap in tfvars files.

**Please note** you cannot do formatting in a .tfvars file. Any variables called here must have distinct values such as those below and cannot be written in the form format("hi%s%01d",var.string,var.number). To do that those variables must be put in [locals.tf](/ce02-wiki/Using-Pipelines/Terraform/Terraform-Hugo-for-Dummies/locals.tf) and then called as local.variable_name

```
resource_group_name = "rg-kubdevce02001hugiac"
storage_account_name = "stakubdevce02001hupea01"
env = "dev"
user = "pea01"
```
