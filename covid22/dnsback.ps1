$zones = Get-Content -path "C:\covid22\dnooslist.txt"

ForEach ($zone in $zones) 
{
Export-DnsServerZone -Name $zone -FileName $zone
}
