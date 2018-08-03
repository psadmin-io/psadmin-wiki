---
title: Remove Long Paths
layout: en
permalink: /posts/admin/long_paths/
---

## Remove Long Paths

Windows often has issues removing folder where nested paths are longer than 256 characters. Two quick ways to remove the folder:

```powershell
Cmd /C ("rmdir /S /Q " + $problematicDir)
```

```powershell
mkdir empty
robocopy .\empty .\weblogic /MIR
rm .\empty; rm .\weblogic
```