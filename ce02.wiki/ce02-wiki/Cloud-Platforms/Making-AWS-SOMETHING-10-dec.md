- Log into AWS
- go to users https://console.aws.amazon.com/iamv2/home?#/users
- security credentials -> create access keys -> download .csv

- make sure you have awscli installed by running choco list -lo, if not, then https://community.chocolatey.org/packages/awscli to download

- configure by following steps on https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html and using details on your csv (we went for location Ireland (eu-west-1) and output json)