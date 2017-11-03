---
title: Mass Resend Reports
layout: en
permalink: /posts/peopletools/resend_content_sql/
---

[David Kurtz has a great post on resending reports in a "Not Posted" status](http://blog.psftdba.com/2008/04/bulk-re-sending-batch-output-to-report.html). The SQL he provides works on Oracle. The SQL below will do the same on MS SQL Server.

```sql

DECLARE @PRCSINSTC INT;

DECLARE PROCESSINSTANCE_CURSOR CURSOR FOR
    SELECT PRCSINSTANCE
    FROM   PSPRCSRQST
    WHERE  DISTSTATUS = 4 --THAT ARE NOT POSTED
    AND    RUNSTATUS = 9;  --SUCCESSFUL PROCESSES

OPEN PROCESSINSTANCE_CURSOR
FETCH NEXT FROM PROCESSINSTANCE_CURSOR INTO @PRCSINSTC
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @PRCSINSTC
         UPDATE PSPRCSRQST
         SET    DISTSTATUS = '7'
         WHERE  PRCSINSTANCE = @PRCSINSTC;

         UPDATE PSPRCSQUE
         SET    DISTSTATUS = '7'
         WHERE  PRCSINSTANCE = @PRCSINSTC;

         UPDATE PS_CDM_LIST
         SET    DISTSTATUS   = '8'
         ,      TRANSFERINSTANCE = 0
         WHERE  PRCSINSTANCE = @PRCSINSTC
         AND    DISTSTATUS   <> '5'; --POSTED
        FETCH NEXT FROM PROCESSINSTANCE_CURSOR INTO @PRCSINSTC
    END;
CLOSE PROCESSINSTANCE_CURSOR;
DEALLOCATE PROCESSINSTANCE_CURSOR;
GO
```