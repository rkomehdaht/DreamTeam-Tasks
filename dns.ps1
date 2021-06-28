#поднятие DNS
Install-WindowsFeature DNS -IncludeManagementTool

#создание записи
Add-DnsServerResourceRecordA -Name myrecord -IPv4Address 1.2.3.4 -ZoneName pc1.local 

#тесты
Test-DnsServer 172.20.10.2
Get-DnsServerDiagnostics
Get-DnsServerZoneScope pc1.local