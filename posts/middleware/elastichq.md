---
title: ElasticHQ
layout: en
permalink: /posts/middleware/elastichq/
---

If you want a utility to help you monitor your Elasticsearch nodes and clusters, ElasticHQ is a plugin that can give you a nice GUI.

## Installation

There are two ways you can install ElasticHQ. If your Elasticsearch server has access to the Internet, you can install the plugin from the command line:

```powershell
cd $ES_HOME\bin
.\plugin install royrusso/elasticsearch-HQ/v2.0.2
```

> You need to use version `2.0.2` with the Elasticsearch 2.3.2 that ships with PeopleTools 8.55 and 8.56. The latest version of ElasticHQ is built for Elasticsearch 5.x

To manually install ElasticHQ:

1. [Download version 2.0.2 from here](https://github.com/royrusso/elasticsearch-HQ/releases)
1. Copy the .zip (or .tar) file to your Elasticsearch server.
1. Extract the .zip file to `$ES_HOME\plugins\hq`
1. Restart Elasticsearch
1. Log into ElasticHQ at http://localhost:9200/_plugin/hq with the `esadmin` account

## Using ElasticHQ

ElasticHQ is meant to give you a read-only view of the system. If you want to make changes, I'd recomment you use Elasticsearch's REST API.

To view a node, enter the URL into the box at the top and click 'Connect'. If your node is part of a cluster, ElasticHQ will show the cluster's nodes. You can view the size of indexes, the stats of each node, and the cluster stats as well.

![ElasticHQ Screenshot]({{ site.url }}/assets/images/elasticHQOverview.png)