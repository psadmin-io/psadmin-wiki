---
title: Puppet Helper Functions
layout: en
permalink: /posts/pca/puppet_helpers/
---

With 8.56, the command line to run Puppet with the DPK got longer. You have to pass in the `--confdir` parameter and path every time you run Puppet.

To simplify the command, a simple Powershell function can be used to run the DPK. Add this function to your `C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1` file.

```powershell
function pa {
    $starttime = $(get-date)
    set-location c:\psft\dpk\puppet
    stop-service Psft*
    puppet apply .\manifests\production\site.pp --confdir=c:\psft\dpk\puppet --strict off -d
    $elapsedtime = $(get-date) - $starttime
    Write-Output "Run Time: ${elapsedtime}"
}
```