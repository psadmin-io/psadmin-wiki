---
title: Search Framework Call Back User
layout: en
permalink: /posts/peopletools/search-callback-user/
---

In Oracle Support and in PeopleBooks, the Search Framework call back user is said to require the `PeopleSoft Administrator` role. Given the power that role gives to a user, this breaks many security policies. Thankfull, this role isn't required for the call back user. Instead follow these guidelines for security with the call back user:

* Set `PTPT3100` as the Primary, Process Profile, and Row Security Permission List
* Assign the following roles: 
    * `PeopleSoft User`
    * `Search Administrator` 
    * `Search Developer` 
    * `Search Query Administrator` 
    * `Search Server` 
    * `Search-xxx`

For your application, the `Search-xxx` Role will give access to the Search Catetories you want to deploy. These roles will change depending on your application and configuration.
