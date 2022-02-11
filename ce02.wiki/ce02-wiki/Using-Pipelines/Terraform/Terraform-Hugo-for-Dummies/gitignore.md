This is a **mostly** generic .gitignore file copied from github, however note that we have removed *.tfvars from the gitignore as we want these different environments on our repos.
We have also added *.tfplan, and .terraform.lock.hcl
Note: *.filetype tells you to ignore **all** files with that file extension

```
# Local .terraform directories
**/.terraform/*

# .tfstate files
*.tfstate
*.tfstate.*

# Crash log files
crash.log

# Exclude all .tfvars files, which are likely to contain sentitive data, such as
# password, private keys, and other secrets. These should not be part of version
# control as they are data points which are potentially sensitive and subject
# to change depending on the environment.
#
#*.tfvars

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Include override files you do wish to add to version control using negated pattern
#
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
.terraformrc
terraform.rc

# extra things that ce02 tends to add to terraform gitignore
*.tfplan 
#the star in *.tfplan means that all files that end with .tfplan will be ignored, e.g. plan.tfplan
.terraform.lock.hcl
```