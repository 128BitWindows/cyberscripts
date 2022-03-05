$users = Get-Content -path "C:\covid22\complist.txt"
$admins = Get-Content -path "C:\covid22\complist.txt"
$password = "OKMpl,123098"

ForEach ($user in $users) 
{

net user $user $password

}