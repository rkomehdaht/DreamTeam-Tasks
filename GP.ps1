#Creating new OU
New-ADOrganizationalUnit -Name "Command" -Path "DC=komehdaht,DC=local"

#Checking new OU
$OUPath = 'OU=Command,DC=komehdaht,DC=local'
If(!(Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$OUPath'")) {

   Write-Warning "Organizational Unit $OUPath does not exist." 
   return}

#Creating new user
New-ADUser komehdaht

#Ckecking new user
$Name = "komehdaht"
$User = Get-ADUser -Filter {sAMAccountName -eq $Name}
If ($User -eq $Null) {Write-Warning "User does not exist in AD" }
Else {Write-Output "User found in AD"}

#Moving new user
Move-ADObject -Identity "CN=komehdaht,CN=Users,DC=komehdaht,DC=local" -TargetPath "OU=Command,DC=komehdaht,DC=local"

#Checking new path
$UserPath = 'CN=komehdaht,OU=Command,DC=komehdaht,DC=local'
If (Get-ADUser -Filter "DistinguishedName -eq '$UserPath'") {

   Write-Output "user moved successfully" 

}
Else {(Write-Warning "user not moved" )}

#New GPO
New-GPO -Name "ScreenSaverTimeOut" -Comment "Sets the time to 900 seconds" 

Set-GPRegistryValue -Name "ScreenSaverTimeOut" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName ScreenSaveTimeOut -Type String -Value 900

New-GPLink -Name "ScreenSaverTimeOut" -Target "OU=Command,DC=komehdaht,DC=local"

#Checking GP
Get-GPRegistryValue -Name "ScreenSaverTimeOut" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" 
Write-Output '"Value" string check'