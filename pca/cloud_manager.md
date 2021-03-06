---
title: Cloud Manager Overview
layout: en
permalink: /pca/cloud_manager/
---

This page will contain an overview of PeopleSoft Cloud Manager.

# DPK Files Repository

Below is an example of how Cloud Manger organizes DPK files in the Download Repository.

```
/cm_psft_dpk/dpk
├── linux
|   ├── IH
|   │   ├── 11
|   │   │   ├── IH-910-UPD-011-LNX_1of11.zip
|   │   │   ├── IH-910-UPD-011-LNX_2of11.zip
|   │   │   └── ...
|   │   └── custom
|   │       └── ODS-DPK-LNX-12.1.0.2-200114.zip
│   ├── FSCM
│   ├── HCM
│   ├── ELM
│   ├── CRM
│   ├── CS
│   └── tools
│       ├── 858
│       │   ├── 06
│       │   │   ├── PEOPLETOOLS-LNX-8.58.06_1of4.zip
│       │   │   ├── PEOPLETOOLS-LNX-8.58.06_2of4.zip
│       │   │   └── ...
│       │   └── custom
│       │       ├── COBOL-DPK-LNX-8.58_03.zip                
│       │       ├── ELK-DPK-LNX-7.0.0_03.zip
│       │       ├── ILOG-CPLEX-12.7.1_01.zip
│       │       └── PT-INFRA-DPK-LNX-8.58-200720.zip
│       ├── 857
│       └── ...
└── windows
    └── ...
```

# File Structure Example
Example from a Cloud Manager deployed instance.

```
/u01/app.oracle/product
├── db
├── <HOSTNAME>
|   ├── dpk
|   │   ├── archives
│   |   ├── pt-manifest
|   │   ├── puppet
|   │   └── readme.txt
|   ├── home
|   │   ├── esadm1
|   │   ├── oracle2
|   │   ├── psadm1
|   │   ├── psadm2
|   │   └── psadm3
│   └── ps_cfg_home
|           ├── appserv
|           ├── ...
|           └── webserv
└── pt
    ├── bea
    │   ├── ...
    │   ├── tuxedo
    │   └── wlserver
    ├── jdk1.8.0_241
    ├── oracle-client
    ├── ps_home8.58.03
    └── tools_client
```
