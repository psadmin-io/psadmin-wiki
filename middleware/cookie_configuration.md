---
title: Cookie Configuration
layout: en
permalink: /posts/middleware/cookie_configuration
---

# Cookie Configuration

To make cookie management easier when managing multiple PeopleSoft environments and applications, use this pattern to simplify the cookie configuration.

`[DBNAME]-PORTAL-PSJESSIONID`

Replace `[DBNAME]` with your database name. This configuration is set in the `weblogic.xml` file for your PIA domain. Below is an example `weblogic.xml` file.

```xml
<?xml version="1.0" encoding="ISO-8859-1" standalone="no"?>
<weblogic-web-app xmlns="http://www.bea.com/ns/weblogic/weblogic-web-app">

<description>PeopleSoft Internet Architecture</description>

  <session-descriptor>
  <id-length>32</id-length>
  <cookie-name>HRDEV-PORTAL-PSJSESSIONID</cookie-name>
  <cookie-domain>.psadmin.io</cookie-domain>
  <monitoring-attribute-name>USERID</monitoring-attribute-name>
  <persistent-store-table>wl_servlet_sessions</persistent-store-table>
  <http-proxy-caching-of-cookies>true</http-proxy-caching-of-cookies>
<!-- Coherence*Web
  <persistent-store-type>coherence-web</persistent-store-type>
-->
  </session-descriptor>
    <container-descriptor>
      <servlet-reload-check-secs>-1</servlet-reload-check-secs>
      <session-monitoring-enabled>true</session-monitoring-enabled>
  </container-descriptor>
  <context-root>/</context-root>
</weblogic-web-app>
```
