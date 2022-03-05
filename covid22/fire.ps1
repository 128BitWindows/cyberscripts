Invoke-Command -ComputerName smallchungus {
Set-NetFirewallRule -DisplayGroup 'File and Printer Sharing' -Enabled True -PassThru |
select DisplayName, Enabled
} -Credential (Get-Credential)