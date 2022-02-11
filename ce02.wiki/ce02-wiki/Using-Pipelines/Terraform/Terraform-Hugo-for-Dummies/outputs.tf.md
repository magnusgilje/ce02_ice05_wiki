Outputs is a file which allows you to run functions which show data. I.e. if you want to make sure that something is working as you go you can run an output function that will print out a name so that you know it has connected the syntax of an output file is 
output "function name" {
    value = <what this is as a variable>
    #e.g. value = data.generic_function_name_from_manual.specific_function_name.terraform_manual_attribute
}
### Generic output function style
```
output "resource attribute being called from terraform manual" {
    value = <data.specific code block being called.resource attribute being called from manual>
}
```

### Example code
```
output "id" {
    value = data.azurerm_resource_group.hugo_iac_rg.id # this is set up as such as it is calling a data function, the generic function name is azure.., and we called it as
    # hugo_ia..., and id gives you all information needed - this is from the terraform registry under Attribute Reference
}

output "object_id"{
    value = data.azuread_group.aad_users.object_id
}

```