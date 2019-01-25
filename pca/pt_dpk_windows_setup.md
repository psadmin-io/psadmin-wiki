---
title: PeopleTools DPK Windows Server 2016 Setup
layout: en
permalink: /posts/pca/pt_dpk_windows_setup/
---

##### PeopleTools DPK Windows Server 2016 Setup

1.  Navigate to [**PeopleTools Home Page**](https://support.oracle.com/epmos/faces/DocumentDisplay?id=2062712.2)  
2.  Download PEOPLETOOLS-WIN-8.5X.XX_1of4.zip through PEOPLETOOLS-WIN-8.5X.XX_4of4.zip  
    Note: Make sure this matches the PeopleTools applied to your PeopleSoft database.  
3.  Create a folder on server called DPK_INSTALL. Copy all zip files to it.  
4.  Extract PEOPLETOOLS-WIN-8.5X.XX_1of4.zip to DPK_INSTALL root  
    Note: If done correctly, you should see a setup folder.  
5. (Optional Step)  
    If you want to use the latest PT DPK for additional fixes/features, perform the following :  
    Note: If you are unsure about this step or have issues, grab the exact PT version that matches your DB and skip this step.  
    * Download latest PEOPLETOOLS-WIN-8.5X.XX_1of4.zip  
    * Rename current setup folder in DPK_INSTALL to `setupold`  
    * Extract PEOPLETOOLS-WIN-8.5X.XX_1of4.zip to DPK_INSTALL root  
    * Open `E:\DPK_INSTALL\setup\bs-manifest`  
    * Change version=8.5x.xx to match what you have applied to your PeopleSoft database.  
    * Open `E:\DPK_INSTALL\setup\puppet\production\data\psft_configuration.yaml` and search for 8.5x then change to the version you are using.  
    Note: If you are running PT 8.56.10 on your DB but are using PT 8.57.12 DPK then you would change this to `8.56` to match the DB version.  
6.  Navigate to DPK_INSTALL/setup  
7.  Run corresponding [DPK setup command](#DPK-Setup-Commands) based on table below. For ex, if you want to deploy midtier you would run `psft-dpk-setup.bat –-env_type midtier`
    ```
    Note: Enter any dummy passwords to get through the initial setup as we will be handling passwords in a future step.
    * Do you want to proceed with Puppet Installation? [Y|n]: Y
    * Enter the PeopleSoft Base Folder: E:\PSoft
    * Are you happy with your answer? [Y|n|q]: Y
    * Enter the PeopleSoft database platform [ORACLE]: MSSQL
    * Is the PeopleSoft database Unicode? [Y|n]: Y
    * Enter the PeopleSoft database name: FSDEV
    * Enter the PeopleSoft database server name: pssql.domain.com
    * Enter the PeopleSoft database Connect ID [people]: people
    * Enter the PeopleSoft database Connect ID [people] password: XXXX
    * Enter the PeopleSoft database Operator ID [QEDMO]: PS
    * Enter the PeopleSoft database Operator ID password: XXXX
    * Enter a new Application Server Domain connection password: XXXX
    * Are you happy with your answers? [y|n]: Y
    * Do you want to continue with the default initialization process? [y|n]: n
    * You have decided not to continue with the default PeopleSoft environment
      setup process. Any customizations to the PeopleSoft environment should be
      done in the Hiera YAML file 'psft_customizations.yaml' and place it under
      [E:\PSoft\dpk\puppet\production\data] folder. After making the
      necessary customizations, run the following commands to continue with the
      setup of PeopleSoft environment.
        1. cd /d E:\PSoft\dpk\puppet\production\manifests
        2. "C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat" apply --confdir=E:\PSoft\dpk\puppet site.pp --debug --trace
        Exiting the PeopleSoft environment setup process.
        The PeopleSoft Environment Setup Process Ended.
    ```
8.  Download and install the latest [**MSSQL ODBC driver**](https://docs.microsoft.com/en-us/sql/connect/odbc/windows/microsoft-odbc-driver-for-sql-server-on-windows) certified by PeopleTools 8.5X.    
    * If setting up process scheduler or application server, configure ODBC for database
Note: As of this writing, the latest supported is ODBC 17  
To check current certification, login to MOS and navigate to the following :  
Certifications -> Desktop Applications, Browsers, and Clients -> Microsoft SQL Server Client -> Microsoft Windows Server 2016.
9.  Download and install latest [**Puppet 5.x agent**](http://downloads.puppetlabs.com/windows/puppet5/puppet-agent-x64-latest.msi)  
    Note: Oracle delivers an outdated puppet 4.5.2 agent which was released back in June 2016. There are 2 main problems with this version :
    * Puppet 4.x is no longer supported by Puppet. See [**Puppet Enterprise Lifecycle**](https://puppet.com/misc/puppet-enterprise-lifecycle)
    * Puppet 5.x contains many enhancements, bug fixes, and security fixes.
10.  Install the following additional puppet modules (from command prompt) :  

```
    puppet module install puppetlabs-acl --confdir E:\PSoft\dpk\puppet
    puppet module install puppetlabs-inifile --confdir E:\PSoft\dpk\puppet
    puppet module install puppetlabs-registry --confdir E:\PSoft\dpk\puppet
    puppet module install ianoberst-xml_fragment --confdir E:\PSoft\dpk\puppet
    puppet module upgrade puppetlabs-stdlib --confdir E:\PSoft\dpk\puppet

Note: If the server does not have internet access, simply download the modules on another machine and copy them to E:\PSoft\dpk\puppet\production\modules
```

11. If using custom windows service accounts, each one will need to be granted rights to logon as service.  
    * Logon to the computer with administrative privileges.  
    * Launch `Control Panel`  
    * Open the `Administrative Tools` and open the `Local Security Policy`   
    * Expand `Local Policy` and click on `User Rights Assignment`  
    * In the right pane, right-click `Log on as a service` and select properties.  
    * Click on the `Add User or Group…` button to add the new user.  
    * In the `Select Users or Groups` dialogue, find the user you wish to enter and click `OK`  
    * Click `OK` in the `Log on as a service Properties` to save changes.  
12. Apply psadmin.io PT DPK patch
    * Make a folder copy of `E:\PSoft\dpk\puppet\production\modules` (This copy will be used in case something goes wrong during the patch process)
    * Create a folder to store git repo’s. For now, we will go with `E:\PSoft\git`  
    * Download and install [**Git**](https://git-scm.com/download/win) for windows.  
    Note: You can choose to do this on your own workstation.
    * Launch Git Bash as administrator
    * `cd /e/PSoft/git`
    * `git clone https://github.com/psadmin-io/pt_dpk_patches`
    * `cd pt_dpk_patches`
    * `git checkout 8.5X`
    * `cd patches`
    * `cp pt_dpk_85XXX.patch /e/PSoft/dpk/puppet/production/modules`
    * `cd /e/PSoft/dpk/puppet/production/modules`
    * `git apply -v --ignore-space-change --whitespace=fix pt_dpk_85XXX.patch`
    Note: This will contain warnings about spacing. It is safe to ignore.
13. Copy `psft_customizations.yaml` from `E:\PSoft\git\pt_dpk_patches\customization_example\windows` to `E:\PSoft\dpk\puppet\production\data`
    * Go through line by line and edit as needed.
14. (Optional Step)  
    If you applied step 4, proceed otherwise continue to step 15.
    * Open `E:\PSoft\dpk\pt-manifest` and verify all versions match what you have in `E:\PSoft\dpk\archives`
    * If you packaged your own archives, copy them to `E:\PSoft\dpk\archives` and make sure the filenames are set properly in `psft_customizations.yaml`
15. Encrypt passwords
    * Create new file `E:\PSoft\dpk\puppet\eyaml.yaml` with content  
     ```
     ---
     pkcs7_private_key: E:\PSoft\dpk\puppet\secure\keys\private_key.pkcs7.pem  
     pkcs7_public_key: E:\PSoft\dpk\puppet\secure\keys\public_key.pkcs7.pem
     ```
    * Right-click on windows `Start` button
    * Click `System` then `Advanced system settings`
    * Click `Environment Variables`
    * Under `System variables`, highlight `Path` then click `Edit...`
    * Click `New` and set value to `C:\Program Files\Puppet Labs\Puppet\sys\ruby\bin`
    * Click `OK`
    * Click `New...` to create a new variable named `EYAML_CONFIG` set to `E:\PSoft\dpk\puppet\eyaml.yaml`
    * Launch Command Prompt or PowerShell as administrator.
    * Run the following commands to update/install eyaml
    ```
    gem install specific_install
    gem specific_install -l https://github.com/voxpupuli/hiera-eyaml
    ```
    * Navigate to E:\PSoft\dpk\puppet\production\data  
    Note: This folder holds all PS configuration files in the YAML format  
    * Create a new file called pwd.yaml with following content :
    ```
    ---
    access_pwd:                      DEC::PKCS7[changeme]!
    domain_conn_pwd:                 DEC::PKCS7[changeme]!
    db_admin_pwd:                    DEC::PKCS7[changeme]!
    db_connect_pwd:                  DEC::PKCS7[changeme]!
    db_user_pwd:                     DEC::PKCS7[changeme]!
    pia_gateway_user_pwd:            DEC::PKCS7[changeme]!
    pia_profile_user_pwd:            DEC::PKCS7[changeme]!
    webserver_admin_user_pwd:        DEC::PKCS7[changeme]!
    webserver_keystore_identity_pwd: DEC::PKCS7[changeme]!
    webserver_keystore_trust_pwd:    DEC::PKCS7[changeme]!
    webserver_private_key_pwd:       DEC::PKCS7[changeme]!
    pia_service_pwd:                 DEC::PKCS7[changeme]!
    prcs_service_pwd:                DEC::PKCS7[changeme]!
    appserver_service_pwd:           DEC::PKCS7[changeme]!
    tuxedo_service_pwd:              DEC::PKCS7[changeme]!
    ```
    * `SET EDITOR=notepad`
    * `eyaml edit -d pwd.yaml`
    * Set passwords and save file
    * Return to command prompt and eyaml should have encrypted file
    * Open `psft_customizations.yaml` and under the `Security` section, replace all the pwd lines with `pwd.yaml`
    * Open `E:\PSoft\dpk\hiera.yaml`. It should look as follows :
    ```
    ---
    :backends:
      - eyaml
      - yaml

    :hierarchy:
      - psft_customizations
      - defaults
      - psft_unix_system
      - psft_deployment
      - psft_configuration
      - psft_patches

    :yaml:
      :datadir: E:\PSoft\dpk\puppet\production\data

    :eyaml:
      :datadir:   E:\PSoft\dpk\puppet\production\data
      :extension: yaml

      :pkcs7_private_key: E:\PSoft\dpk\puppet\secure\keys\private_key.pkcs7.pem
      :pkcs7_public_key:  E:\PSoft\dpk\puppet\secure\keys\public_key.pkcs7.pem

16. Run puppet apply
    * Execute command `puppet apply E:\PSoft\dpk\puppet\production\manifests\site.pp --confdir E:\PSoft\dpk\puppet --debug --trace`


### DPK Setup Commands
|Deployment|DPK Setup Script Command|
| --------- | ----------- | 
| Do everything! Install Oracle Tuxedo, Oracle Weblogic, Oracle database client and PS_HOME. Configure appserver domain, webserver domain, process scheduler domain and install oracle database client|psft-dpk-setup.bat --env_type midtier|
|Install Oracle Tuxedo, Oracle Weblogic and Oracle database client. Create PS_HOME.| psft-dpk-setup.bat --env_type midtier --deploy_only or psft-dpk-setup.bat --env_type midtier --deploy_only --deploy_type all|
|Create PS_HOME only| psft-dpk-setup.bat --env_type midtier --deploy_only --deploy_type tools_home|
|Create Appserver domain|psft-dpk-setup.bat --env_type midtier --domain_type appserver|
|Create Process Scheduler domain|psft-dpk-setup.bat --env_type midtier --domain_type prcs|
|Create PIA domain|psft-dpk-setup.bat --env_type midtier --domain_type pia|
|Create Appserver and process scheduler domains|psft-dpk-setup.bat --env_type midtier --domain_type appbatch|
|Create Appserver, process scheduler and PIA domains|psft-dpk-setup.bat --env_type midtier --domain_type all|
|Remove all domains|psft-dpk-setup.bat --cleanup|
|Create PS_APP_HOME|psft-dpk-setup.bat --env_type midtier --deploy_only --deploy_type app_home|
|Create PS_HOME and PS_APP_HOME|psft-dpk-setup.bat --env_type midtier --deploy_only --deploy_type app_and_tools_home|
[Source](https://peoplesofttutorial.com/peoplesoft-dpk-setup-commands/)  


### ODBC Certifications
|PeopleSoft PeopleTools 8.56 with Microsoft SQL Server Client 2017|Platform Version|Supported Version|Support Status|Application Server| Batch Server|PT Client|
| --------- | ----------- | --------- | ----------- | --------- | ----------- | ----------- | 
|Microsoft Windows x64(64-bit)|10|ODBC Driver17 for SQL Server version 2017.170.01.01|Supported|No|No|Yes|
|Microsoft Windows x64(64-bit)|8.1|ODBC Driver17 for SQL Server version 2017.170.01.01|Supported|No|No|Yes|
|Microsoft Windows x64(64-bit)|8|ODBC Driver17 for SQL Server version 2017.170.01.01|Supported|No|No|Yes|
|Microsoft Windows x64(64-bit)|2012 R2|ODBC Driver17 for SQL Server version 2017.170.01.01|Supported|Yes|Yes|Yes|
|Microsoft Windows x64(64-bit)|2012|ODBC Driver17 for SQL Server version 2017.170.01.01|Supported|No - Withdrawn|No - Withdrawn|	Yes|
|Microsoft Windows x64(64-bit)|2016|ODBC Driver17 for SQL Server version 2017.170.01.01|Supported|Yes|Yes|Yes|
`Additional Information
Microsoft SQL Server Client 2017 requires 8.56.10 as the minimum patch level for People Tools 8.56`

### Links
[ODBC]: https://docs.microsoft.com/en-us/sql/connect/odbc/windows/microsoft-odbc-driver-for-sql-server-on-windows  
[Puppet]: http://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.8-x64.msi  
[Git]: https://git-scm.com/download/win  
