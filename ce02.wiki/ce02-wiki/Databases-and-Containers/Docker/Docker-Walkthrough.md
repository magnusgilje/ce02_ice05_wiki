# Docker Walkthrough

## Prerequisites 
install `az`
https://docs.microsoft.com/en-us/cli/azure/
choco install azure-cli

[ACR Location](https://portal.azure.com/#@kubrickgrouptraining.onmicrosoft.com/resource/subscriptions/f92c3804-6fcc-478e-a9cc-0304683d131f/resourceGroups/rgce02dockerdev01/providers/Microsoft.ContainerRegistry/registries/acrdockerdevguest/overview)

test `az version`
`az login --tenant c56ac403-160c-4cd5-937a-d9154c81466b`
`az account set --subscription f92c3804-6fcc-478e-a9cc-0304683d131f`
`az account show`
`az acr list`

---

## Sync existing container

To retrieve from public  `albertotron/flask_website`

``` bash
docker pull albertotron/flask_website
```

Our new target is `acrdockerdevguest.azurecr.io`

## Send image to azure

``` bash
az acr login --name acrdockerdevguest
docker tag albertotron/flask_website acrdockerdevguest.azurecr.io/flask_website:mpdev1
docker push acrdockerdevguest.azurecr.io/flask_website:mpdev1
```

### Create smaller package

Based in `docker-multicloud\hugo`

``` Dockerfile
FROM httpd:2.4
COPY ./public/ /usr/local/apache2/htdocs/
```


``` bash
docker build . -t hugo:mpdev
docker tag hugo:mpdev acrdockerdevguest.azurecr.io/hugo:mpdev
docker push acrdockerdevguest.azurecr.io/hugo:mpdev
```

To test the container locally

``` bash
docker pull acrdockerdevguest.azurecr.io/hugo:mpdev
docker run -p 80:80 acrdockerdevguest.azurecr.io/hugo:mpdev
```

To stop the container

``` bash
docker container ls --format "{{.ID}} {{.Image}}"
docker stop 
```

## Deploy to cloud

|Field|Description|
|-|-|
|`-g`|Target Azure Resource Group |
|`-n`|Human friendly name|
|`-l`|Geographical Region|
|`--cpu`|Number CPUs needed for this container|
|`--memory`|GBs of memory needed for this container|
|`--ip-address`|Determine if the container requires a public IP address|
|`--image`| Image name in the form `Registry`/`image`:`version`|
|`--registry-username`| Azure username for the container registry|
|`--registry-password`| Azure password for the container registry|
|`--vnet`| Network used for container|
|`--subnet`| subnet used for the container|
|`--log-analytics-workspace`|ID for the logging target| 
|`--log-analytics-workspace-key`| Application key|

if i wanted public access i can add `--ip-address public`

``` 
az container create -g rgce02dockerdev01 -n hugompdev -l northeurope --cpu 0.2 --memory 0.2  --image acrdockerdevguest.azurecr.io/hugo:v1 --registry-username acrdockerdevguest --registry-password 8h8ofmOYjJyhSOBHV6O+MD55zeYiWKKr --vnet /subscriptions/f92c3804-6fcc-478e-a9cc-0304683d131f/resourceGroups/rg-ce02-hub/providers/Microsoft.Network/virtualNetworks/vnetce02hub --subnet containers
```

## Validate within cloud

``` bash
az container show -g rgce02dockerdev01 -n hugompdev
```

look at the content and find the ip address e.g. 

```
 "ipAddress": {
    "dnsNameLabel": null,
    "dnsNameLabelReusePolicy": "Unsecure",
    "fqdn": null,
    "ip": "10.0.3.4",
    "ports": [
      {
        "port": 80,
        "protocol": "TCP"
      }
    ],
    "type": "Private"
  },
  "location"
```

connect to to site `http://10.0.3.4`

### delete from the cloud

``` bash
az container delete -y -g rgce02dockerdev01 -n hugompdev
```

## Even Smaller package
``` Dockerfile
FROM httpd:2.4-alpine
COPY ./public/ /usr/local/apache2/htdocs/
```
```
docker build . -t hugo:mpdev-alpine
docker tag hugo:mpdev-alpine acrdockerdevguest.azurecr.io/hugo:v1-alpine
docker push acrdockerdevguest.azurecr.io/hugo:v1-alpine
```
```
az container create -g rgce02dockerdev01 -n hugompdevalpine -l northeurope --cpu 0.2 --memory 0.2  --image acrdockerdevguest.azurecr.io/hugo:v1-alpine --registry-username acrdockerdevguest --registry-password 8h8ofmOYjJyhSOBHV6O+MD55zeYiWKKr --vnet /subscriptions/f92c3804-6fcc-478e-a9cc-0304683d131f/resourceGroups/rg-ce02-hub/providers/Microsoft.Network/virtualNetworks/vnetce02hub --subnet containers
```
```
az container show -g rgce02dockerdev01 -n hugompdev
az container delete -y -g rgce02dockerdev01 -n hugompdev
```


Adding logging

```
az container create -g rgce02dockerdev01 -n hugompdev -l northeurope --cpu 0.2 --memory 0.2  --image acrdockerdevguest.azurecr.io/hugo:v1 --registry-username acrdockerdevguest --registry-password 8h8ofmOYjJyhSOBHV6O+MD55zeYiWKKr --vnet /subscriptions/f92c3804-6fcc-478e-a9cc-0304683d131f/resourceGroups/rg-ce02-hub/providers/Microsoft.Network/virtualNetworks/vnetce02hub --subnet containers --log-analytics-workspace 240242a6-9c37-4240-996e-ea3de9d1ef2a --log-analytics-workspace-key lMiNcm3Tgb3xgr+Z66tCLuBkgsd3l+MPUszJ/sWpPugIdRVridK0gPdmVLUjp1MUeXt5kjFme1IgB3r3+jFkkQ==
```