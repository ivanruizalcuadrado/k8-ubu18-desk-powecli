#!/bin/bash

#####################
# Fist script run
######################

echo "ivanruizalcuadrado/k8-ubu18-desk-powecli" > HelloGithub.txt


# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
# Another packet manager
sudo apt-get install aptitude -y
# Another packets
aptitude install iputils-ping inetutils-ping mtr -y
aptitude install curl -y
aptitude install wget -y
aptitude install xymon-client -y
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Enable the "universe" repositories
sudo add-apt-repository universe
# Install PowerShell
sudo apt-get install -y powershell
echo "POWERSHELL INSTALADO"
# Start PowerShell and install vmware modules to use powercli
pwsh /root/k8-ubu18-desk-powecli/install-powercli.ps1
# Run listener with powershell in POD
pwsh /root/k8-ubu18-desk-powecli/listener-https.ps1
