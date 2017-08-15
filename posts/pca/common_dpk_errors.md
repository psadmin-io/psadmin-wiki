---
title: Common DPK Errors
layout: en
permalink: /posts/pca/common_dpk_errors/
---

## Common DPK Errors

Here are some common DPK errors and how to resolve them.

### `This platform is not supported`

This error can occur when running the bootstrap script (`psft-dpk-setup`) if the `setup` folder is in the wrong location. After downloading the DPK files, you need to extract the first .zip file. Make sure the `setup` folder from the first .zip file (and other files from the .zip file) are at the same directory as the remaining .zip files. If the `setup` folder is one level deeper (e.g, under `PEOPLETOOLS-WIN-8.56.02_1of4\setup`) you will see this error. 

To resolve the error, move the `setup` folder (and other files in the directory) up one level. 