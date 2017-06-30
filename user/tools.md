---
title: Software and Tools
layout: en
permalink: /user/tools/
---


This page is a collection of different tools that I use to make a PS Admin's job easier. Some of these are freeware or open source while others are worth paying for.

## Security

*   [Password Safe][1] - Free Password Safe offers excellent security for all the passwords you manage. You could memorize your passwords (ugly), keep them on a spreadsheet (bad), or use Password Safe to keep all your passwords safely encrypted. The only password you need to remember is the safe's master password. Once you open the safe, just double-click on the password you want to use and paste password. You don't even need to know the underlying passwords! Password Safe also has a good password generator feature. You can set up the password rules and let it generate them for you.
*   [Keystore Explorer][2] - Free Keystore Explorer is a great tool for working with java keystore files, like `pskey`. The `pskeymanager` wrapper only offers a subset of functions for the Java `keytool` program. Keystore Explorer offers the same features as `keytool` but has a nice GUI to work with.

## Server Administration

*   [RDC Manager][3] - Free If you are in a Windows-heavy environment, this tools is a great way to manage all of your servers and remote connections. RDC Manager easily organizes all of your servers into groups, lets you connect to multiple RDC sessions, and saves your login credentials.

*   [mRemoteNG][4] - Free remote desktop tool that supports both RDP and PuTTy SSH connections.

*   [Beyond Compare][5] = $30 or $50 for Pro Beyond Compare is the best file and directory compare utility. It is incredibly fast for comparing two folder together, changing what differences you see, easily compares complex files and can synchronize folders. Beyond Compare is also scriptable, so you can take advantage of it's features on the command line.

## Development

*   [SublimeText][6] - Free to Try, $70 SublimeText is my favorite text editor. There are many editors to choose from, and I've tried lots, but I keep coming back to SublimeText. SublimeText has lots of plug-ins for editing and syntax highlighting, and is very responsive with large files. [Package Control][7] is a plug-in manager for SublimeText that makes it easy to install new plug-ins. Install Package Control when you open Sublime Text for the first time.

*   [Programmer's File Editor][8] - Free PFE has almost no modern features, but it does one thing well: it opens very large text files without any issues. Do you have 1GB trace file that needs to be searched? Use PFE.

*   [SQR Express][9] - $149 SQR Express is a great editor for SQR programs. The ability to run the program within the editor is wonderful and it has useful tools for writing SQR programs.

*   [TraceMagic][10] - Free TraceMagic simplifies much of the information in `.tracesql` files. TraceMagic will group SQL statements, show you all the tables in the FROM clause, tables that are being Updated or Inserted. It is much easier to find the errors using TraceMagic. You will need an Oracle Support account to download; search for Doc ID `1470578.1`.

*   [SQL Developer][11] - Free SQL Developer has really improved in the latest versions and I enjoy using it more than Toad. It's a great SQL tool when working on Oracle databases. Not much else to say, it's a solid tool.

*   [PSChrome Extension][12] - Free For Chrome only, but this extension has features to make working in PeopleSoft easier. I really like the Auto-Refresh on the Process Scheduler page and the Field Information mode. The Auto-Refresh will select the Refresh button on the Process Scheduler page at an interval you want. It's a simple way to watch what is happening on the scheduler. The Field Information mode will let you click on any text box, button, or label on a page and it gives you the record and field name. That saves a trip to App Designer.

*   [DataDumper Application Class][13] - Free The DataDumper application class let's you dump the structure and content of a PeopleCode object to file. You can even email the output so you don't have find it on the server. Import the `CHG_DataDumper` class and away you go. There is even a [great overview video on how to use the application class][14].

## Documentation

*   [Instiki][15] - Free I have found that wiki is the best way to keep documentation as a PS Admin. Instiki is a very simple wiki that makes it easy to create pages, link topics, and reduces the amount of work to keep documentation up-to-date. It is a light-weight wiki based on Ruby on Rails which makes it easy to run on any server.

*   [Slack][16] - Free for small teams
    
    Slack is essentially IRC, but web-based and app-based with better features. I love using it with remote teams because it replaces the hallway discussions and creates better communication within teams.

 [1]: http://www.pwsafe.org
 [2]: http://keystore-explorer.sourceforge.net
 [3]: http://www.microsoft.com/en-us/download/details.aspx?id=44989
 [4]: https://github.com/mRemoteNG/mRemoteNG
 [5]: http://www.scootersoftware.com
 [6]: http://www.sublimetext.com
 [7]: https://packagecontrol.io/installation#st3
 [8]: http://www.lancaster.ac.uk/~steveb/cpaap/pfe/pfefiles.htm
 [9]: http://sqrexpress.com
 [10]: http://support.oracle.com
 [11]: http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html
 [12]: https://chrome.google.com/webstore/detail/pschrome/cpgoncheakfjhldfbebekijoeaabnfeb?hl=en
 [13]: http://www.cedarhillsgroup.com/training-videos/peoplecode-debugging-with-the-datadumper
 [14]: http://www.cedarhillsgroup.com/knowledge-base/kbarticles/introduction-to-the-datadumper-logger
 [15]: https://github.com/parasew/instiki
 [16]: https://slack.com