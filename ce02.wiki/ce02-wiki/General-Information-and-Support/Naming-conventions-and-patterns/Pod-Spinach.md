Cloud Naming & Tags for all three Clouds:
- Virtual machines
- Network interface
- Public IP address
- Storage
- Logging
- Network
- Subnets
- Cloud Functions


Azure Specific
- Resource Group
rg-<app or service name>-<subscription type>-<###>
rg-mktgsharepoint-prod-001
rg-acctlookupsvc-shared-001
rg-ad-dir-services-shared-001
rg-kubdevce020fn
- KeyVault


###Tagging:
We have been using 4 tags to associate with most tasks/functions/objects. This has been done to make it easier to search for the specific objects using these tags, allowing for quicker identification and easier tracing of who has been involved.

For using an example of someone in `cohort:ce02` and `pod,user:spi05`
|Tag Name|Our Tags|
|-|-|
|cohort|ce02|
|user|05|
|environment (env for short)|dev/prod/test|
|pod|spi|