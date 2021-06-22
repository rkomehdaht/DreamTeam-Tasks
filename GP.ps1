New-ADOrganizationalUnit -Name "Command" -Path "DC=komehdaht,DC=local"
New-ADUser komehdaht
Move-ADObject -Identity "CN=komehdaht,CN=Users,DC=komehdaht,DC=local" -TargetPath "OU=Command,DC=komehdaht,DC=local"
New-GPO -Name FIRSTGPO | New-GPLink -Target "OU=Command,DC=komehdaht,DC=local"
Set-GPLink -Name FIRSTGPO -Target "OU=Command,DC=komehdaht,DC=local" -LinkEnabled Yes