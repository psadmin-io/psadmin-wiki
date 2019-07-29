---
title: Slow WebLogic Starts
layout: en
permalink: /posts/middleware/slow_weblogic_starts/
---

If Weblogic is booting slowly on Linux, it might be a low entropy situation. If entropy is less than 1000, 

```bash
cat /proc/sys/kernel/random/entropy_avail
```

you should install a tool to help generate more entropy.

## haveged

`haveged` is one tool to help generate entroy on Linux.

```bash
sudo rpm -Uvh https://download.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum install haveged -y
sudo chkconfig haveged on
```

Test that entropy is added to the system.

```bash
cat /dev/random | rngtest -c 1000
```

Start `haveged` to generate entropy for the system.

```bash
sudo /usr/sbin/haveged -w 1024
```