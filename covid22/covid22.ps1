$computers = Get-Content -path "C:\covid22\complist.txt"
$password = ConvertTo-SecureString "Password123!@#" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ("Administrator", $password)

ForEach ($computer in $computers) 
{

Invoke-Command -ComputerName $computer {
Set-NetFirewallRule -DisplayGroup 'File and Printer Sharing' -Enabled True -PassThru |
select DisplayName, Enabled
} -Credential $Cred

Invoke-Command -ComputerName $computer {
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
net user Guest /active:no
} -Credential $Cred

Invoke-Command -ComputerName $computer {
Set-NetFirewallRule -DisplayGroup 'File and Printer Sharing' -Enabled False -PassThru |
select DisplayName, Disabled
} -Credential $Cred

}
