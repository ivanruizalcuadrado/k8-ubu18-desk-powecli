# k8-ubu18-desk-powecli
# VMWare PowerCli PODs for K8 Kubernetes cluster


This deployment uses PowerShell into PODs. 
There is an auto-installation PowerShell environment with Powercli and one Listener using a port waiting to run something in powershell

Procedure:

Install PowerShell for Linux in nodes and master.
kubectl create -f pod-definition.yaml

Order script execution:

1.- install-pwsh.sh

2.- install-powercli.ps1

3.- listener-https.ps1 ( modify port to listen into this dile )

mailto: ivanruizalcuadrado@gmail.com





