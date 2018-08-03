---
title: Common DPK Errors
layout: en
permalink: /posts/pca/common_dpk_errors/
---

Here are some common DPK errors and how to resolve them.

## `This platform is not supported`

This error can occur when running the bootstrap script (`psft-dpk-setup`) if the `setup` folder is in the wrong location. After downloading the DPK files, you need to extract the first .zip file. Make sure the `setup` folder from the first .zip file (and other files from the .zip file) are at the same directory as the remaining .zip files. 

If the `setup` folder is one level deeper (e.g, under `PEOPLETOOLS-WIN-8.56.02_1of4\setup`) you will see this error. 

    .
    ├── PEOPLETOOLS-WIN-8.56.02_1of4
    │   ├── setup
    │   └── readme.txt
    ├── PT-DPK-WIN-8.56.02-1of2.zip
    ├── PT-DPK-WIN-8.56.02-2of2.zip
    ├── PTC-DPK-WIN8.56.02-1of1.zip

To resolve the error, move the `setup` folder (and other files in the directory) up one level. 

    .
    ├── PT-DPK-WIN-8.56.02-1of2.zip
    ├── PT-DPK-WIN-8.56.02-2of2.zip
    ├── PTC-DPK-WIN8.56.02-1of1.zip
    ├── readme.txt
    └── setup


## `found character that cannot start any token while scanning for the next token`

This error will display during the Puppet catalog build. The catalog build is when Puppet is performing Hiera lookups. The error can result from two common causes:

1. The YAML file has a Tab character in it
1. A string with special characters is not quoted

To resolve the first issue, use your text editor to convert any Tab characters into spaces. For the second issue, make sure you use single quotes around passwords or any value that has special characters in it.