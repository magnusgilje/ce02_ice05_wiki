# Naming convention

Virtual Machines- vm
Network Interface- nic
Public IP Address- pip
Storage- st
Logging- log
Network- net
Subnets- sbnt
Cloud Function- cfn
Resource Group- rsg
Key Vault- kv
---
### [resource type]-[project]-[platform]-[env]-[region]-[group][instance]
---
###Example
```
nic-ce02-az-dev-euwest1-ice001
```
| Description    | Requirement constraints |
|----------------|-------------------------|
| Resource Type  | Len 4, a-z              |
| Project        | Len 4-10, a-z0-9        |
| platform       | Len 3, a-z              |
| Environment    | Len 3-4, a-z              |
| Region         | Len 4-10, a-z0-9        |
| Group          | Len 3, a-z              |
| Instance       | Len 3, 0-9              |

### Variables
---
```
variable "resource_type" {
   type = string
   default = "___"
}
variable "project" {
   type = string
   default = "ce02"
}
variable "platform" {
   type = string
   default = "gcp"
}
variable "env" {
   type = string
   default = "dev"
}
variable "region" {
   type = string
   default = "euwest2"
}
variable "group" {
   type = string
   default = "ice"
}
variable "instance" {
   type = number
   default = "001"
}
```
### Locals
---
```
locals{
  my_name = format("%s-%s",var.project, var.group)
  file_name = format("%s-%s",var.resource_type,var.project,"%s-%s",var.platform,var.env,"%s-%s",var.region,var.group,var.instance)
}
```
### Output
---
```
output "file_name" {
  value=local.file_name
}
output "user" {
  value=local.my_name
}
```