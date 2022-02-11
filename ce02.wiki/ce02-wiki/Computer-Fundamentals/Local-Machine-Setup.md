# Local Machine Setup
[[_TOC_]]

## Windows

### Install Ubuntu

Follow [Ubuntu Install Instructions](https://ubuntu.com/wsl) for setup of Windows Subsystem for Linux

## Windows Store
Add the following items from the Windows Store


1. Windows Terminal
1. Microsoft Remote Desktop
1. Azure VPN Client

## Chocolatey

### Install backend

As an `Admin user` run a `cmd` prompt and run the following command

```cmd
powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### Install `adobereader`, `vscode` and `git`

``` cmd 
choco install adobereader vscode  git -y
```


### Install main tools for Cloud Engineering

This will install a large number of tools for use with cloud engineering

``` cmd
choco install 7zip adobereader aescrypt anaconda3 curl docker-desktop dotnetcore-3.1-sdk dotnetcore-sdk dotnetfx eksctl gcloudsdk git git-credential-manager-for-windows golang GoogleChrome graphviz hugo-extended kind kubernetes-cli kubernetes-helm lastpass Minikube mongodb mysql mysql-connector netfx-4.7.2 network-miner nodejs powershell-core putty python3 sqlserver-odbcdriver terraform terraform-docs vscode WestwindWebSurge winmerge winscp zoom -y
```

## MacOS

[Downloads for Macs](/ce02-wiki/Computer-Fundamentals/Local-Machine-Setup/Downloads-for-Macs)