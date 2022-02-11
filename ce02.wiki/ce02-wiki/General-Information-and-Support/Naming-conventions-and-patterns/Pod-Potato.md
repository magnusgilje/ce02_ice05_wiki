![Capture.PNG](/.attachments/Capture-69f5a887-4ed9-4d53-96eb-2a094cdbcf6b.PNG)

Link to naming rules:
https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules

# Naming Convention for Azure, AWS & GCP Services




Virtual machines
- vm<policy name or app name><##>
- vmce02pot<user><instance>
- vmce02pot0101

Network interface
- nic<##>-<vm name>-<environment><##>
- nic-vmce02pot0101-dev-01

Public IP address
- pip-<vm name>-<environment>-<region>-<##>
- pip-vmce02pot0101-dev-euwest2-01

Storage (no dashes)
- stvm<performance type><environment><region><###>
- stvmstdeveuwest201
- performance type: premium(pm), standard(st)

Logging
- log<subscription><environment><##>
- log-ce02-dev-01

Network
- vnet<subscription><region><##>
- vnet-ce02-euwest2-01

Subnets
- snet<subscription><region><##>
- snet-ce02-euwest2-01

Cloud Functions
- cld-<app name>-<environment>-<###>.cloudapp.net}
- cld-circle-dev-01.azurewebsite.net
- cld-circle-dev-01.amazonaws.com
- cld-circle-dev-01.cloudfunctions.net

**Azure specific services**

Resource Group
- rg-<environment>-<subscription>-<app name>
- rg-dev-ce02pot01-demo01

KeyVault0
- kv-<environment>-<subscription>-<app name><##>
- kv-dev-ce02pot01-demo01

# Tagging

We have decided to include the following tags for each resource:
| Tag      | Example Value |
| ----------- | ----------- |
| cohort | ce02 |
| pod | pot |
| user | pot04 |
| env      | prod |
| purpose      | demo |