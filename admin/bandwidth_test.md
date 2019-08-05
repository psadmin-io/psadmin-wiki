---
title: Bandwidth Test
layout: en
permalink: /posts/admin/bandwidth_test/
---

## Bandwidth Testing with iperf

If you want to do a quick test of your network between two servers (say, between to reqions in a cloud provider), you can quickly do that with [`iperf`](https://iperf.fr). `iperf` is a multi-platform utility to test and measure the capacity of your network.

### Installation

Install `iperf` on two servers. Make sure to choose two servers that will traverse the part of the network you want to test. If you are running some cloud servers and want to test the bandwith from your on-prem network, install `iperf` on one on-prem server and one cloud server.

For Linux, set the EPEL repo first.

**Linux 7**

```bash
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
```

**Linux 6**

```bash
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -ivh epel-release-6-8.noarch.rpm
```

Use `yum` to intall `iperf`.

```bash
sudo yum install iperf -y
```

On Windows, visit the [download page](https://iperf.fr/iperf-download.php#windows) or use [Chocolatey](https://chocolatey.org/packages/iperf3)

```powershell
choco install iperf3 -y
```

### Run a bandwith test

On `server1` we will configure `iperf` to act as the receiving end (the server).

```bash
sudo iperf -s
```

On `server2` we will configure `iperf` to send data to our server.

```bash
sudo iperf 10.0.10.1
```

`iperf` will run a short test and report the results.

```
------------------------------------------------------------
Client connecting to 10.0.10.1, TCP port 5001
TCP window size: 45.0 KByte (default)
------------------------------------------------------------
[  3] local 10.0.9.1 port 59004 connected with 10.0.10.1 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec   717 MBytes   601 Mbits/sec
```

You can reverse the test too so that `server1` sends the data back to `server2`. Just add the `-R` flag.

```bash
sudo iperf 10.0.10.1 -R
```

You can also control how long the test runs by adding the `-t` flag and specify the number of seconds to run the test.

```
sudo iperf 10.0.10.1 -t 60
```

You can also tell `iperf` to run parallel tests with `-P` if you really want to try maxing out your network.

```bash
sudo iperf 10.0.10.1 -P 3 -t 120
```