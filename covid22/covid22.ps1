$computers = Get-Content -path "C:\complist.txt"

ForEach ($computer in $computers) 
{
Invoke-Command -FilePath c:\covid22\swipt.ps1 -ComputerName $computer
}
