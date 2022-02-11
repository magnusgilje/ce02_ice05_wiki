# Setup for Azure on local machine

## Sign into the Azure Cloud from a browser

1. Follow Link from the Email sent today to sign-in
2. Navigate to the site https://portal.azure.com
3. From the blue banner on the  top right select the `Kubrick Group` and switch to `Kubrick Group Training`
4. You will be asked to create a new authenticator account for the sign-in. This is **NOT** a replacement for the `kubrickgroup.com` MFA on your phone, but instead will sit along side it.
5. Navigate to the following URL `https://portal.azure.com/#@kubrickgrouptraining.onmicrosoft.com/resource/subscriptions/f92c3804-6fcc-478e-a9cc-0304683d131f/resourceGroups/rgce02dockerdev01/overview` to confirm you can see the Azure Container Registry.
6. Congratulations you have signed into azure via the portal.

## Install the Azure CLI

1. Install `az cli` tool by either following the link from https://docs.microsoft.com/en-us/cli/azure/ or if you are a chocolatey user run `choco install azure-cli`
2. Test your install by opening a command prompt
3. Run `az version` to check that it is installed
4. Log into azure from the command prompt by running `az login` and following the login steps.
5. Check you have the correct azure subscription set by running `az account set --subscription f92c3804-6fcc-478e-a9cc-0304683d131f`
6. Check that you can see the Azure Cloud Registry by running the command `az acr list`
7. Congratulations you have signed into the azure cloud from the command line.

## Install the Azure VPN Client

1. Open the `Windows Store Application` on your Kubrick Laptop
2. Search for the "Azure VPN Client" Application
3. Install the tool
4. The finalization of the setup will be given during the surgery sessions