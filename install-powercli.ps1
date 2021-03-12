write-host "Installing modules to powershell"
Install-Module -Name VMware.PowerCLI  -Scope allusers -Confirm:$false -Force
Install-Module -Name Posh-SSH   -allowclobber -Scope allusers -Confirm:$false -Force
Install-Module -Name SqlServer -Scope allusers
# Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $true  -Confirm:$false -Force
new-item $PROFILE.AllUsersAllHosts -ItemType file -Force
echo "MODULOS DE VMWARE INSTALADOS"
echo "FIN"
