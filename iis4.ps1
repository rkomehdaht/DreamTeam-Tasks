# install IIS and subfeatures
Install-WindowsFeature -name Web-Server -IncludeManagementTools

    # check IIS 
    While ((Get-WindowsFeature Web-Server).InstallState -eq "Installed"){
    if ((Get-WindowsFeature Web-Server).InstallState -eq "Installed") {
        Write-Host "IIS is installed on $vm";break
    } 
    else {
        Write-Host "IIS is not installed on$vm"

    # Wait for IIS installing
    Wait-Event -Timeout 30
    }
    }
#Import-Module
Import-Module -Name WebAdministration

# check picture from internet 
  $url = "https://lifeandjoy.ru/uploads/posts/2014-07/1406568288_lifrandjoy.ru_26.jpg"

    # create the request.
    $HTTP_Request = [System.Net.WebRequest]::Create('https://lifeandjoy.ru/uploads/posts/2014-07/1406568288_lifrandjoy.ru_26.jpg')

    # get a response from the site.
    $HTTP_Response = $HTTP_Request.GetResponse()

    # get the HTTP code as an integer.
    $HTTP_Status = [int]$HTTP_Response.StatusCode

    If ($HTTP_Status -eq 200) {
        Write-Host "picture is avelible"
    }
    Else {
        Write-Host "picture isn't avelible"
    }

    # clean up the http request by closing it.
    If ($HTTP_Response -eq $null) { } 
    Else { $HTTP_Response.Close() }

# change picture in destination folder
   Invoke-WebRequest -Uri $url -OutFile "C:\inetpub\wwwroot\iisstart.png"
   
    # check of chainging
    Wait-Event -Timeout 5
    $diff=((ls C:\inetpub\wwwroot\iisstart.png).LastWriteTime - (Get-Date)).TotalSeconds
    if ($diff -gt -1) {
        Write-Output "picture is chaingin"
    }
    Else {
        Write-Host "picture isn't chaingin"
    }

<# check site 
        create the request.#>
    $HTTP_Request = [System.Net.WebRequest]::Create('http://localhost/')

    # get a response from the site.
    $HTTP_Response = $HTTP_Request.GetResponse()

    # get the HTTP code as an integer.
    $HTTP_Status = [int]$HTTP_Response.StatusCode

    If ($HTTP_Status -eq 200) {
        Write-Host "site is OK"
    }
    Else {
         Write-Host "The Site may be down"
    }

    # clean up the http request by closing it.
    If ($HTTP_Response -eq $null) { } 
    Else { $HTTP_Response.Close() }


   # open site 
   Start "http://localhost/"
