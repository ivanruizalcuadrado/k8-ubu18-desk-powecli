# k8-ubu18-desk-powecli

This deployment use powershell into PODs.
There is an auto installtion of powershell, powercli and one listener in a port to receive http petitions.

Procedure:

- Install powershell for linux in nodes and master
- kubectl create -f pod-definition.yaml

Order:

1.- install-pwsh.sh

2.- install-powercli.ps1

3.- listener-https.ps1





