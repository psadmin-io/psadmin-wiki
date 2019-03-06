---
title: PIA 404 Errors
layout: en
permalink: /posts/middleware/pia_404_errors/
---

If you receive a 404 error when trying to open the PIA login page, or even the `/index.html` file at the root of your web server, this is most likely due to errors in your `web.xml` file.

`$PS_CFG_HOME/webserv/<domain>/application/peoplesoft/PORTAL.war/WEB-INF/web.xml`

This file defines the filters used by WebLogic to control traffic, servlets that are registered, and MIME Type Mappings. If there are syntax errors in this file, the WebLogic application won't successfully start (even though the web server instance is booted).

Syntax errors might be:

* un-matched XML tags
* duplicate tags

After fixing the errors in `web.xml`, restart your web server.