[[_TOC_]]
## CE02 Naming Conventions

## AZURE

Adheres to MS naming rules:
_https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules_

| Resource          | Convention                                | Example                | Character Limit | Naming Limitations                                                                                                                   |
|-------------------|-------------------------------------------|------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Virtual machines  | vm`cloudid` `app name` `###`              | vmtom04sh001           | 1-15            | Can't use spaces, control characters, or special characters                                                                          |
| Network interface | nic`vm name`                              | nictom04sh001          | -               | -                                                                                                                                    |
| Public IP Address | pip`vm name`                              | piptom04sh001          | -               | -                                                                                                                                    |
| Storage           | st`cloudid` `env` `app name` `###`               | sttom04devsh001           | 3-24            | Lowercase letters and numbers                                                                                                        |
| Logging           | ai`subscription type`                     | aice02training         | 1-80            | Alphanumerics and hyphens                                                                                                            |
| (Virtual) Network | vnet`subscription type` `region` `###`      | vnetce02trainingeuw001 | 1-80            | Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore                            |
| Subnets           | snet`subscription type` `region` `###`      | snetce02trainingeuw001 | 1-80            | Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore                            |
| Cloud Function    | func`cloudid` `app name` `###`              | functom04sh001         | 2-60            | Contains alphanumerics and hyphens. Can't start or end with hyphen                                                                   |
| Resource Group    | rg`cloudid` `app name` `subscription type` `env` `###` | rgspi05shce02trainingdev001 | 3-63            | Lowercase letters and numbers. Start with lowercase letter                                                                           |
| KeyVault          | kv`cloudid` `app name` `env` `###`           | kvtom04shdev008        | 3-24            | Alphanumerics and hyphens. Alphanumerics and hyphens. Start with letter. End with letter or digit. Can't contain consecutive hyphens |

```
locals {
    cohort_id = format("ce%02d",var.cohort_no)
    subscription_type = format("%straining",local.cohort_id)
    vm_name = format("vm%s%s%03d",var.cloud_id,var.app,var.iteration)
    ni_name = format("nic%s",local.vm_name) #may also be var.vm_name if calling externally
    pip_name =format("pip%s",local.vm_name)
    sa_name = format("st%s%s%s%03d",var.cloud_id,var.env,var.app,var.iteration)
    log_name = format("ai%s",local.subscription_type)
    vnet_name = format("vnet%s%s%03d",local.subscription_type,var.region,var.iteration)
    snet_name = format("snet%s%s%03d",local.subscription_type,var.region,var.iteration)
    func_name = format("func%s%s%03d",var.cloud_id,var.app,var.iteration)
    rg_name = format("rg%s%s%s%03d",var.cloud_id,var.app,local.subscription_type,var.env,var.iteration)
    kv_name = format("kv%s%s%s%03d",var.cloud_id,var.app,var.env,var.iteration)
}
```
## GCP

Adheres to GCP naming rules: _Match the regular expression [a-z] ([-a-z0-9]*[a-z0-9])?. This means that the first character must be a lowercase letter, and all the following characters must be hyphens, lowercase letters, or digits, except the last character, which cannot be a hyphen._

| Resource          | Convention                           | Example                | Character Limit |
|-------------------|--------------------------------------|------------------------|-----------------|
| Virtual machines  | vm`cloudid` `app name` `###`           | vmtom04sh001           | 1-63            |
| Network interface | nic`vm name`                         | nictom04sh001          | 1-63            |
| Public IP Address | pip`vm name`                         | piptom04sh001          | 1-63            |
| Storage           | st`cloudid` `env` `app name`           | sttom04devsh           | 1-63            |
| Logging           | log`subscription type`               | aice02training         | 1-63            | Alphanumerics and hyphens |
| (Virtual) Network | vnet`subscription type` `region` `###` | vnetce02trainingeuw001 | 1-63            |
| Subnets           | snet`subscription type` `region` `###` | snetce02trainingeuw001 | 1-63            |
| Cloud Function    | func`cloudid` `app name` `###`         | functom04sh001         | 1-63            |

```
locals {
    cohort_id = format("ce%02d",var.cohort_no)
    subscription_type = format("%straining",local.cohort_id)
    vm_name = format("vm%s%s%03d",var.cloud_id,var.app,var.iteration)
    ni_name = format("nic%s",local.vm_name)
    pip_name =format("pip%s",local.vm_name)
    sa_name = format("st%s%s%s%03d",var.cloud_id,var.env,var.app,var.iteration)
    log_name = format("ai%s",local.subscription_type)
    vnet_name = format("vnet%s%s%03d",local.subscription_type,var.region,var.iteration)
    snet_name = format("snet%s%s%03d",local.subscription_type,var.region,var.iteration)
    func_name = format("func%s%s%03d",var.cloud_id,var.app,var.iteration)
}
```


## AWS
Adheres to AWS naming rules:
_https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html_
_https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html_

| Resource                  | Convention                           | Example                | Character Limit |
|---------------------------|--------------------------------------|------------------------|-----------------|
| Elastic Compute           | ec`cloudid` `app name` `###`           | ectom04sh001           | 1-63            |
| Elastic Network interface | enic`vm name`                        | enicectom04sh001         | 1-63            |
| Public IP Address         | pip`vm name`                         | pipectom04sh001          | 1-63            |
| S3                        | s3`cloudid` `env` `app name`           | s3tom04devsh           | 1-63            |
| Logging                   | log`subscription type`               | aice02training         | 1-63            |
| Virtual Private Cloud     | vpc`subscription type` `region` `###`  | vpcce02trainingeuw001  | 1-63            |
| Subnets                   | snet`subscription type` `region` `###` | snetce02trainingeuw001 | 1-63            |
| AWS Lambda                | lambda`cloudid` `app name` `###`       | lambdatom04sh001       | 1-63            |
| AWS Key name              | key`cloudid` `cohort` `env`  `###`       | keytom00ce02dev001       | 1-63            |
| ECR              | `prefix` `environment` `cohort` `suffix`       | kubrickdevce02tomtig       | 1-63            |
| EKS | `environment` `cohort` `ekscluster` `suffix`       | devce02eksclustertomtig      | 1-63            |

```
locals {
    cohort_id = format("ce%02d",var.cohort_no)
    subscription_type = format("%straining",local.cohort_id)
    ec_name = format("ec%s%s%03d",var.cloud_id,var.app,var.iteration) #amazon's annoying name for a virtual machine
    enic_name = format("enic%s",local.ec_name)
    pip_name = format("pip%s",local.ec_name)
    s3_name = format("s3%s%s%s",var.cloud_id,var.env,var.app)
    log_name = format("log%s",local.subscription_type)
    vpc_name = format("vpc%s%s%03d",local.subscription_type,var.region,var.iteration)
    snet_name = format("snet%s%s%03d",local.subscription_type,var.region,var.iteration)
    lambda_name = format("lambda%s%s%03d",var.cloud_id,var.app,var.iteration)

}
```


# Tagging:
Five tags have been chosen to associate with each item. These have been chosen so that any item can be found by filtering these tags, and so that there are a reasonable number of tags to associate, so people actually follow the convention.

**Cohort:**
Lowercase cohort code.
eg. cohort: `ce02`

**Pod:**
Lowercase pod name.
eg. pod: `tomato`

**Environment:**
Lowercase codes for the environment the item will be used in.
eg. env: `dev`, env: `test`, env: `prod`

**Creator:**
The lowercase cloud id of the user that created the item. Cloud id should be in the form `three letter pod abbreviation` `two digit REST group code`.
eg. creator: `tom00`

**Purpose:**
For what reason has this been created?
Below, example of Hugo Infrastructure As Code
eg. purpose: `huiac` 


