# Naming Convention
## Overall convention:
**cohort**
For us this should always be *ce02*
**group**
for us this should always be *gar* (could be other groups though if we want)
**user**
This should be *00* for group work, and *01-05* for individual work based on user number
**entity**
This must be one of:
*vm* - virtual machine
*ip* - Public IP Address
*ni* - network interface
*st* - storage
*lg* - logging
*nw* - network
*sn* - subnet
*cf* - cloud function (also known as a lambda function in AWS)
*Note - specific to Azure*
*rg* - resource group
*kv* - keyvault

**specific name**
This should be the first four characters of your specific name, e.g. the Class Circle would be *circ*, a key made for sharing banking stuff would be *bank* etc.

E.G. ce02gar01cfcircle01 
This is the naming convention for cohort CE02, garlic group, user 1, a cloud function type, the specific name is circle, and it is the first version of the work

## Examples
### AWS
https://aunmeqoju9.execute-api.eu-west-1.amazonaws.com/default/ce02gar01cfcirc

### Azure
https://ce02gar01cfcirc.azurewebsites.net/api/ce02gar01cfcirc

### GCP
https://europe-west2-ce02-330213.cloudfunctions.net/ce02gar01cfcirc