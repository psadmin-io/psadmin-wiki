---
title: Windows Services
layout: en
permalink: /posts/admin/windows_services/
---

## Start/Stop Services

The built-in cdmlets are great for starting and stopping a group of services. If you have Powershell Remoting enabled, you can use the `-computername` parameter to pass in a server or list of servers to execute the command remotely.

*Start*

```powershell
get-service -name psft* -computername <server or server,list> | start-service
```

*Stop*

```powershell
get-service -name psft* -computername <server or server,list> | stop-service
```

## Delete Services

Since there is no `delete-service` cmdlet, use this command to delete services by name. For each service that contains "psft", loop through the services and delete them.

```powershell
Get-WmiObject -Class Win32_Service -Filter "Name='psft*'" | % { $_.delete() }
```