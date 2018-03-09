---
title: Working with a Custom Change Package
layout: en
permalink: /posts/development/custom_change_package/
---

Author: Andy Dorfman

## Prepare External Objects

### Create DMS file

- `d:\temp\update_psstatus.dms`
```sql
    set log update_psstatus.log;
    update PSSTATUS set LASTCHANGEDTTM = %CurrentDateTimeIn;
```

## Application Designer portion

### Create Custom File Code (PSTYPECODEDEFN)

- `Application Designer` > `Tools` > `Miscellaneous Definitions` > `File Type Codes`
```yaml
FILEREFTYPECODE:    'CUSTOM_SCRIPTS'
FILEREFPATH:        '%ps_cust_home%\scripts'
DESCRLONG:          'LBC PS_CUST_HOME\scripts folder'
```

### Create Custom Script File Reference

- `Application Designer` > `New` > `File Reference`
```yaml
File Name and Path: "Click on ... to select a file `D:\temp\update_psstatus.dms`"
Binary:             'No'
Database Platform:  'All'
PeopleSoft Server:  'File Server'
Operating System:   'All'
```

- `Application Designer` > `File` > `Save As`
```yaml
Save Name As:   'UPDATE_PSSTATUS_DMS'
File Type Code: 'CUSTOM_SCRIPTS'
```
- Click `OK` to save
- Replace `D:\temp\update_psstatus.dms` with `%FILEREFPATH%\update_psstatus.dms`
- Click `OK` to save again
- Click `F7` to import File Reference Definition into the project

- `Application Designer` > `File` > `Save Project`
```yaml
Save Project Name As: 'LBC_IT0001'
```
- Click `OK` to save

- `Application Designer` > `Tools` > `Project Properties`
```yaml
Description:    'Testing CUSTOM_SCRIPTS File References'
Comments:       'Testing description'
Change Project: 'Check'
Update ID:      'LBC_IT0001'
Add: 
```
- Click `OK`
- `Application Designer` > `File` > `Save All`
- `Application Designer` > `Upgrade` Tab
- Doube-Click on `File References`, Check `Execute` Flag
- `Application Designer` > `File` > `Save All`

### Create Change Package

- `Application Designer` > `Tools` > `Create Change Package`
- Click `OK`
```yaml
Export Directory:       'd:\temp\LBC_IT0001'
File Reference Path:    'D:\temp'
Update ID:              'LBC_IT0001'
Generate New Template:  'Check'
```

- `Application Designer` > `Tools` > `Finalize Change Package`
```yaml
Export Directory: 'd:\temp\lbc_it0001\updlbc_it0001'
```
- Click `OK`

### Apply Change Package

 - Place `d:\temp\LBC_IT0001\updLBC_IT0001\updLBC_IT0001.zip` in CA's `download` directory
 - `Change Assistant` > `Tools` > `Apply Change Package` > `Apply Automatically Without Compare` > `Next` > `Apply without using Change Impact Analyzer` > `Next` > Select product line release > `Next` > Select target environment > `Next` > Select Host > `Next` > Provide Credentials > `Next` > Select download directory > `Next` > Select `UPDLBC_IT0001` > `Next` > `Next` > `Validate Now` (make sure psemagent is running) > `Begin Apply`

 - Examine the log file for `Deploy Files` > `File Type Code: CUSTOM_SCRIPTS` > `UPDATE_PSSTATUS_DMS`

> It looks like it's finding only 1 file server under PS_HOME and deploying the file udpate_psstatus.dms only to that 1 location, most likely due to me selecting only 'File Server' during File Reference creation.  Nothing got transferred to PS_CUST_HOME

 - Examine the view Script for `Execute File References` > `Execute DMS` > `UPDATE_PSSTATUS_DMS`
 
 > It is executing update_psstatus.dms script from the staging directory
