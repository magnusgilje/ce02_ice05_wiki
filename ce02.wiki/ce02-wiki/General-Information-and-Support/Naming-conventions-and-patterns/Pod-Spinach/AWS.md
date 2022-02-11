# AWS Naming Conventions
## Virtual Machines
- EC2 naming conventions
- It is recommended to use the following pattern (default) for naming your EC2 instances: ^ec2-(ue1|uw1|uw2|ew1|ec1|an1|an2|as1|as2|se1)-([1-2]{1})([a-c]{1})-(d|t|s|p)-([a-z0-9\-]+)$.


- Network interface
- Public IP address
- Storage

## Storage: S3 Buckets
{teamName} - {userID} - {environment} - {scope}

Logging

- Logging
- Network
- Subnets
- Cloud Functions

## __Resource Groups__
- A Resource Group is a collection of resources that shares one or more tags.
- In AWS, examples of a resource is an entity such as an EC2 and a S3 bucket.
- Custom consoles can be created that organize and unite all resources for a specific project in a single view.

### Tag Based Resource Group

### Compound Tags
- There is a limit of 50 tags per resource in AWS
- Good practice says to combine several tag keys and values into a single compound tag.
- "OwnerName", "OwnerPhone" and "OwnerEmail" can be combined into 1 key called OwnerContact" which can contain the values of Name,Phone and Email using a pipe delimiter


### Style Rules
- Tag key names are case-sensitive and can contain mixed-case letters, numbers, underscores and hyphens.
- Tag key names should user Upper CamelCase(Pascal case).
- Tag values are case-sensitive and should not use the semi-colon `;`, equals sign `=` or pipe `|`


### Tagging Region Codes

