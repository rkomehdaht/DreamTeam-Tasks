# install IIS and subfeatures
Install-WindowsFeature -name Web-Server -IncludeManagementTools


#check IIS
if ((Get-WindowsFeature Web-Server).InstallState -eq "Installed") {
    Write-Host "IIS is installed on $vm"
} 
else {

    Write-Host "IIS is not installed on$vm"

# Wait for IIS installing
Wait-Event -Timeout 30
}


#Import-Module
Import-Module -Name WebAdministration

<#  picture
1) open picture from internet
2) change picture in destination folder
#>
  $url = "https://lifeandjoy.ru/uploads/posts/2014-07/1406568288_lifrandjoy.ru_26.jpg"

   Invoke-WebRequest -Uri $url -OutFile "C:\inetpub\wwwroot\iisstart.png"
   
   #open site
   Start "http://localhost/"