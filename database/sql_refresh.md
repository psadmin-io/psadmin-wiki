---
title: SQL to Update Tables on Refresh
layout: en
permalink: /posts/database/sql_refresh/
---

## SQL to Update Tables on Refresh

We all refresh production PeopleSoft database to non-production environments. How we handle those refreshes can vary, but in the end we need to update tables in the database to make the copy of production work in the new environment. This article will give a list of tables to update and sample SQL statements to make those updates.

> Unless called out, SQL is written for Oracle databases

### Access ID

```sql
-- --------------------
-- Set New Schema Owner
-- --------------------

alter user SYSADM identified by <new password>;

update ps.psdbowner set 
       ownerid = 'SYSADM', 
       dbname = 'DEV'
 where dbname = 'PRD';

update psadm.psstatus set 
       ownerid = 'SYSADM', 
       lastrefreshdttm = sysdate;

update psadm.psaccessprofile set 
       STM_ACCESS_ID = '<encrypted value>', 
       STM_ACCESS_PSWD = '<encrypted value>', 
       STM_ACCESS_PART1 = '<encrypted value>', 
       STM_ACCESS_PART2 = '<encrypted value>', 
       ENCRYPTED = '1', STM_ENCRYPTION_VER = '1' 
 WHERE SYMBOLICID = 'SYSADM1';
```

### PSOPTIONS