- **Virtual machines**
Unique within resource group
Standard = ```vm<policy name or app name><###>```
Example = ```vmnavigator001```
Kubrick = ```ce02vmspi01```
Chosen = ```<cohort>vm<userid><###>```
- **Network interface**
Unique within resource group
Standard = ```nic-<##>-<vm name>-<subscription>-<###>```
Example = ```nic-01-dc1-shared-001```
Kubrick = ```ce02vmspi01371```
Chosen = ```<cohort>nic<userid><###>```
- **Public IP address**
Unique within resource group
Standard = ```pip-<vm name or app name>-<environment>-<region>-<###>```
Example = ```pip-dc1-shared-eastus2-001```
Kubrick = ```pipce02hub```
- **Storage Accounts**
Unique globally
Standard = ```stvm<performance type><app name or prod name><region><###>```
Example = ```stvmstcoreeastus2001```
Kubrick = ```stakubdevce02001hugar00```
Chosen = ```sta<company><env><cohort><###><userid>```
- **Logging - Storage account (diagnostic logs)**
Standard = ```stdiag<first 2 letters of subscription name and number><region><###>```
Example = ```stdiagsh001eastus2001```
Kubrick = ```lace02hub```
- **Network (Virtual Networks)**
Unique only within it's resource group.
Standard = ```vnet-<subscription type>-<region>-<###>```
Example = ```vnet-shared-eastus2-001```
Kubrick = ```vnetce02hub```
- **Subnets**
Unique within a virtual network.
Standard = ```snet-<subscription>-<region>-<###>```
Example = ```snet-shared-eastus2-001```
Kubrick = ?
- **Cloud Functions (Function App)**
Standard = ```func-<app name>-<environment>-<###>.azurewebsites.net```
Example = ```func-navigator-prod-001.azurewebsites.net```
Kubrick = ```ce02spi01circle```


## Azure Specific
- **Resource Group**
Standard = ```rg-<app or service name>-<subscription type>-<###>```
Example = ```rg-mktgsharepoint-prod-001```
Kubrick = ```rg-kubdevce020fn```
Chosen = ```rg-<company>dev<cohort><###><purpose>```
- **KeyVault**
Globally unique
Kubrick = ```kv-dev-democe02-spi01```
Chosen = ```kv-dev-<cohort>-<userid>-<###>```

## Naming convention

Unique to Kubrick
- Cohort : ```ce02```
- Pod : ```Spinach```
- User : ```spi01```, ```spi02```, ```spi03```, ```spi04``` and ```spi05```


1. A 2-5 letter abbreviation of what is being named. (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

2.

3. Instance number

```<resource/service>-<environment>-<cohort>-<pod/user>-<instance>```

### Rules and restrictions
- **Virtual Machines**
1-15 char (Windows)
1-64 char (Linux)
Can't use spaces, control characters, or these characters:
~ ! @ # $ % ^ & * ( ) = + _ [ ] { } \ | ; : . ' " , < > / ?
Windows VMs can't include period or end with hyphen.
Linux VMs can't end with period or hyphen.

- **Network Interface**
1-80 Characters
Alphanumerics, underscores, periods, and hyphens.
Start with alphanumeric. End alphanumeric or underscore.

- **Public IP Address**
1-80 characters
Alphanumerics, underscores, periods, and hyphens.
Start with alphanumeric. End alphanumeric or underscore.

- **Storage Accounts**
3-24 characters
Lowercase letters and numbers.

- **Logging**

- **Network (Virtual Networks)**
3-64 Characters
Alphanumerics, underscores, periods, and hyphens.
Start with alphanumeric. End alphanumeric or underscore.

- **Subnets**
1-80 Characters
Alphanumerics, underscores, periods, and hyphens.
Start with alphanumeric. End alphanumeric or underscore.

- **Cloud Functions (Function App)**

- **Resource Group**

- **KeyVault**
3-24 Characters
Alphanumerics and hyphens.
Start with letter. End with letter or digit. Can't contain consecutive hyphens.