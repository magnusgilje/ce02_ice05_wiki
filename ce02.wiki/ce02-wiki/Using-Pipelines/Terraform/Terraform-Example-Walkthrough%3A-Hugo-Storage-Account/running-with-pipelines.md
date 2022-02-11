##Azuread
---
Add the service principal shown below, with Get and List security permissions
```
data "azuread_service_principal" "terraform_users" {
  display_name = "ce02-Azure-Terraform-dev"
}
```
---
```
access_policy {
  tenant_id = data.azurem_client_config.current.tenant_id
  object_id = data.azuread_service_principal.terraform_user.object_id

  secret_permissions = [
    "Get", "List"
  ]
}
```
---
### Error
if you get this error, make sure you  update the pipeline branch source to main
![image.png](/.attachments/image-71a6afb1-b942-4e52-9804-1241d0f82c4f.png)
