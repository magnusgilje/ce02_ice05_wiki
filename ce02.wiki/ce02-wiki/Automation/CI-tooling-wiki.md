To download teamcity:

- Ensure a suitable VM Size has been chosen.  
- Connect into your VM.  
- Use the following website to download the wizard.
https://www.jetbrains.com/teamcity/download/
- Run the download wizard as admin.
- Ensure Javascript is enabled.  
- Once the downloads complete, find the folder and view the readme.  The next step is there.  You do this in the command prompt, in the teamcity folder.  
- If anyone wanted to see a website, you should be able to access the website from any other computer using the vpn we downloaded earlier in the course and typing in the IP Address and port number into a browser.  **Internet explorer doesnt have any support anymore :( Use chrome.**
- To download chrome , run `$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)` from admin powershell prompt
- Once you've accessed that website, you should be able to create pipelines and proceed below to download packages and verify the versions downloaded.  

**!Troubleshooting!**

When going through the wizard, you need to use it as a user account.  There may be an issue where you don't have the rights to run as a system.  To counter this, go into the VM start menu and work your way into the folders shown below.  

![MicrosoftTeams-image (1).png](/.attachments/MicrosoftTeams-image%20(1)-9a88263e-368f-46b8-af29-678d10a930ce.png)

Add your username (it may be ubuntu or something similar!) and then retry logging in.  

---------------------------------------------------------
run this line of code to start up the team city on the vm, make sure you are in the teamcity folder, so the path may be different
```
C:\TeamCity>.\bin\runAll.bat start
```
When running the localhost in browser for each startup of teamcity, ensure that '/login' is not present in the url.

Similarly, to stop the service
```
C:\TeamCity>.\bin\runAll.bat stop
```
---
#### Installations
---
The following packages must be installed on to the machine:
Chocolatey v0.11.3
curl 7.80.0
azure-cli 2.31.0
hugo-extended 0.90.1
git 2.34.1
python3 3.10.1
terraform 1.1.0
googlechrome

# TeamCity
To install chocolatey, go into admin powershell.
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
Test if choco has been installed:
```
choco
```

then run

```
choco install curl git -y
```

then to check version list:
```
choco list -lo
```
To install others
```
choco install azure-cli hugo-extended python3 terraform googlechrome -y
```
---
## Running pipeline in TeamCity
---
Log into VM using bastion
To open the Teamcity on your local computer, use a VPN.
![vpn.png](/.attachments/vpn-7e1f4967-2d2e-4766-9928-1278126dea5b.png)
Run the url to access teamcity VM. - http://10.0.0.9:8111/
The 8111 is chosen in the setup of teamcity.
- Run `ipconfig` to find your own IP address so that you navigate to `http://[your IP address]:[your port]/`

Once run on your local machine
- set the Teamcity directory to match your download location.
- select Internal (HSQLDB) - the default ![tc1.png](/.attachments/tc1-c91da56f-9af8-46a5-aa46-f3aad438c479.png)

- accept the user agreement
- create admin account and keep details secure ![login.png](/.attachments/login-df95fabb-811e-4e34-91fa-dac02be95ce7.png)
- create project ![create project tc.png](/.attachments/create%20project%20tc-a575ffe9-cc30-4b03-a1e4-556f58d1e1cd.png)
- manually![manually.png](/.attachments/manually-32c33553-3ec0-4f5b-99ac-d2bffde5cac9.png)
- create project name ![project name.png](/.attachments/project%20name-38475c04-7830-4a54-bbd4-a7bee88505d5.png)
- create build project ![create build config.png](/.attachments/create%20build%20config-a2ce3e1b-e9be-4f49-8318-dd89031ad684.png) 
- ![create build project.png](/.attachments/create%20build%20project-e450bed6-68c5-4a11-82ec-f643378a2af3.png)
- skip vcs ![skip.png](/.attachments/skip-ca74226f-3029-4832-852b-6b45471c94e2.png)
- verify all the choco installs ![step1.png](/.attachments/step1-aab426ce-f4ea-4ea9-b037-5702a4ac4375.png)
- steps for each function ![buildsteps.png](/.attachments/buildsteps-a2f9b778-7740-470e-8e5d-e977d6aa3cfe.png)

## Check tools for TeamCity exist
whoami
(gci env:path).value -split ";"
git --version
curl --version
hugo version
terraform -version
python --version
az version


# Jenkins
The Jenkins VM uses Ubuntu.
Some of the aforementioned programs come pre-installed on the machine.

To log into our jenkins vm, go to it in the azure portal, then connect via bastion using the username chosen and ssh private key from keyvault. Use the private vm key from vault ending in ops.

WARNING: This is a preliminary list of commands, they have not been trialed. This list is only for referencing and will be updated once we have successfully installed the required  programs.

### To install jenkins
First install java
```
sudo apt update
sudo apt search openjdk
sudo apt search openjdk
sudo apt install openjdk-11-jdk
```
`java -version` To check version

Then Install Jenkins
Use the following guide: https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04

### Other installations
To install git
```
sudo apt-get update
sudo apt-get install git
```
To install terraform
```
wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
sudo apt install zip -y
sudo unzip terraform_0.14.3_linux_amd64.zip
```
`sudo mv terraform /usr/local/bin/` #move to location

To install azure
```
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash 
az --version
```
To install hugo
`wget https://github.com/gohugoio/hugo/releases/download/v0.92.0/hugo_0.92.0_Linux-64bit.deb`
`sudo dpkg -i hugo_0.92.0_Linux-64bit.deb
`

update python (comes preinstalled)
```
sudo apt -y upgrade
```

install tree
```
sudo apt install tree
```
### Tools for Blist theme

```
sudo apt install npm -y
npm install postcss-cli (during pipline stage instead of before)
```
## Check tools for Jenkins exist

git --version
java --version
terraform version
az --version
hugo version
python3 --version
tree --version

## Pipeline1
* Tool versions
## Pipeline2a
* Connect to azure with managed identity
## Pipeline2b
* Connect to git repo in azure devops using a personal access token (PAT) and run tree
* For jenkins, this can be done at the start of pipeline 3.
## Pipeline3
* Jenkins version of AZURE hugo website pipeline
* For blist, postcss-cli needs to be installed in the directory before the site is built. The build will fail with a postcss-cli installed beforehand on the machine.
```
npm install postcss-cli
```

