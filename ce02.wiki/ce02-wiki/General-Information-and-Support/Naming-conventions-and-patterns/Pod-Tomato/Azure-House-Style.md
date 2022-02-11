## MS Azure Naming Convention

Adheres to MS naming rules, stored here:
https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules

|Resource|Convention|Example|Character Limit|Naming Limitations|
|-|-|-|-|-|
|Virtual machines|vm<cloudid><app name><###>|vmtom04sh001|1-15|Can't use spaces, control characters, or special characters|
|Network interface|nic<vm name>|nictom04sh001|-|-|
|Public IP Address|pip<vm name>|piptom04sh001|-|-|
|Storage|st<cloudid><env><app name>|sttom04devsh|3-24|Lowercase letters and numbers|
|Logging|ai<subscription type>|aice02training|1-80|Alphanumerics and hyphens|
|(Virtual) Network|vnet<subscription type><region><###>|vnetce02trainingeuw001|1-80|Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore|
|Subnets|snet<subscription type><region><###>|snetce02trainingeuw001|1-80|Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore|
|Cloud Function|func<cloudid><app name><###>|functom04sh001|2-60|Contains alphanumerics and hyphens. Can't start or end with hyphen|
|Resource Group|rg<app name><subscription type><###>|rgshce02training001|3-63|Lowercase letters and numbers. Start with lowercase letter|
|KeyVault|kv<cloudid><app name><env><###>|kvtom04shdev008|3-24|Alphanumerics and hyphens. Alphanumerics and hyphens. Start with letter. End with letter or digit. Can't contain consecutive hyphens|