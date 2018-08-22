---
title: DPK Cleanup Process
layout: en
permalink: /posts/dpk/cleanup/
---

## DPK Cleanup Process

The DPK uses a process called "cleanup" to remove installed software and domains. The cleanup process uses Puppet to delete installed files and folders. You can run the cleanup process two ways:

1. The bootstrap script
1. Using `puppet apply`

### The bootstrap script

The bootstrap scripts (`psft-dpk-setup`) has a parameter you can pass to remove installed software: 

*8.55 DPK on Windows*
```powershell
.\psft-dpk-setup.ps1 --cleanup
```
*8.56 DPK on Windows*
```bat
.\psft-dpk-setup.bat --cleanup
```
*Linux*
```powershell
.\psft-dpk-setup.sh --cleanup
```


### Using puppet apply

To run the cleanup process with Puppet, you set the `ensure: absent` parameter in the `defaults.yaml` file. When you run `puppet apply`, Puppet will remove everything it knows about.

### Controlling the cleanup process

If there is software, domains or users you want to keep, you can use your `psft_customizations.yaml` file to keep things. For example, if you want to keep your old PS_HOME folder, copy the `ps_home:` hash to your `psft_customizations.yaml` file and add the `remove: false` to the hash:

```yaml
ps_home:
  db_type:    "%{hiera('db_platform')}"
  unicode_db: "%{hiera('unicode_db')}"
  location:   "%{hiera('ps_home_location')}"
  remove:     false
```

Many of the hashes in the `psft_deployment.yaml` and `psft_unix_system.yaml`support the `remove: false` setting.