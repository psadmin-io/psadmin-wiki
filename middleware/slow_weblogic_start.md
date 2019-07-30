---
title: Slow WebLogic Starts
layout: en
permalink: /posts/middleware/slow_weblogic_starts/
---

If Weblogic is booting slowly on Linux, it might be a low entropy situation. To view your entropy available:

```bash
sudo watch -n 1 cat /proc/sys/kernel/random/entropy_avail
```

If entropy is less than 1000, you should install a tool to help generate more entropy.

## haveged

[`haveged`](https://issihosts.com/haveged/) is one tool to help generate entroy on Linux.

**Linux 6**
```bash
sudo rpm -Uvh https://download.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum install haveged -y
sudo chkconfig haveged on
sudo /usr/sbin/haveged -w 1024
```

**Linux 7**
```bash
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install haveged -y
sudo systemctl enable --now haveged
```

### Verify Entropy Levels
Test that entropy is added to the system.

```bash
cat /dev/random | rngtest -c 1000
```