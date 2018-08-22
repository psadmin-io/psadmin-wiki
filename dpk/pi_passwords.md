---
title: PeopleSoft Image Passwords
layout: en
permalink: /posts/dpk/pi_passwords/
---

## PeopleSoft Image Passwords

With PeopleTools 8.56, there are some new passwords you create when installing a PeopleSoft Image. Each password has different complexity requirements, so it can be confusing when creating demo passwords. Here is a sample file of passwords to use:

<script src="https://gist.github.com/iversond/8f3dd42116511312cde14517bcd9df29.js"></script>

The `admin_pwd` password is a new field for 8.56. This password is for the `SYS` and `SYSTEM` account in Oracle Database. The complexity requriements are strange; a special character is required but the special character can only be `_` `-` or `#`.