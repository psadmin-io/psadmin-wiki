---
title: WebLogic Demo Certificates
layout: en
permalink: /posts/admin/wl_demo_certs/
---

## WebLogic Demo Certificates

The demo certificates delivered with WebLogic and used by the PIA are stored in the file:

```bash
$PS_CFG_HOME/webserv/<domain>/security/DemoIdentity.jks
```

To access the keystore, you can use `keytool` which is included with the JDK:

```bash
keytool -list -keytore $PS_CFG_HOME/webserv/<domain>/security/DemoIdentity.jks
```

| Property             | Value                                                     |
|----------------------|-----------------------------------------------------------|
| Trust store location | `$ORACLE_HOME/bea/wlserver/server/lib/DemoTrust.jks`      |
| Trust store password | `DemoTrustKeyStorePassPhrase`                             |
| Key store location   | `$PS_CFG_HOME/webserv/<domain>/security/DemoIdentity.jks` |
| Key store password   | `DemoIdentityKeyStorePassPhrase`                          |
| Private key password | `DemoIdentityPassPhrase`                                  |

> This information is from [G's Blog](http://kingsfleet.blogspot.com/2008/11/using-demoidentity-and-demotrust.html)