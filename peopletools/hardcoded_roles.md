---
title: Hardcoded Roles
layout: en
permalink: /posts/peopletools/hardcoded_roles/
---

There's a few hardcoded roles that if you don't know about, you can spend hours debugging why data is missing, or something isn't working.  

Some aren't strictly hardcoded, but are good bootstrap roles that give you the right permission lists to get productive quicker.  

The are mostly just for admin/priveleged accounts, and should probably not be used everyday in Production.

# PeopleTools

## PeopleSoft Administrator

The godfather.  Gives you full access to all pages/components, and bypasses permission list security

## Portal Administrator

The godmother.  Gives you full access to the portal objects (folders and content refs), so you can find and navigate to all components (which you then access via PeopleSoft Administrator role)

## ProcessSchedulerAdmin

Allows you to see all processes in *PeopleTools > Process Scheduler > Process Monitor*

## ReportSuperUser

Allows you to see all reports in *PeopleTools > Reporting Tools > Report Manager*

## ADS Designer

Allows you to apply delivered change packages that use Application Data Sets via Change Assistant without complaint

## PivotGridAdmin

Allows you to see all the delivered (and other users') pivot grids via *Reporting Tools > Pivot Grids > Pivot Grid Wizard*

## XMLP Report Developer

I don't think you can get far in *Reporting Tools > BI Publisher* without this.

## Search Administrator, Search Developer

Use these when seeing up Elasticsearch using the activity guides

# HCM

# Financials

# Campus
