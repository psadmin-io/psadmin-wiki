---
title: Windows Services
layout: en
permalink: /posts/admin/windows_services/
---

## Start/Stop Services

The built-in cmdlets are great for starting and stopping a group of services. If you have Powershell Remoting enabled, you can use the `-computername` parameter to pass in a server or list of servers to execute the command remotely.

*Start*

```powershell
get-service -name psft* -computername <server or server,list> | start-service
```

*Stop*

```powershell
get-service -name psft* -computername <server or server,list> | stop-service
```

## Change Startup Type of Service

Situations sometimes arise where you need to set service startup to either `Manual`, `Automatic` or `Disabled`.  To achieve that, use  `Set-Service` command, e.g.

```powershell
# Set All PeopleSoft Services to manual startup
Get-Service *psft* | Set-Service –StartupType 'Manual'
```

## Delete Services

Since there is no `delete-service` cmdlet, use this command to delete services by name. For each service that contains "psft", loop through the services and delete them.

```powershell
 Get-WmiObject -Class Win32_Service | Where-Object { $_.name -like 'Psft*' } | % { $_.delete() }
```

You can also drop into a Windows Command Shell or PowerShell and use `sc.exe` to delete a service.

```powershell
sc.exe delete PsftAppServerDomainAPPDOMService
```
