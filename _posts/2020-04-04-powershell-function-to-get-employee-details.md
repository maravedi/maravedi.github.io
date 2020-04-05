---
layout: post
title:  "PowerShell Function to Get Employee Details"
date: 2020-04-04 22:15 -0400
dateupdated:   2020-04-04 22:15:00 -0400
categories: powershell function get-aduser get-employee
---

## {{ page.title }}
The `ActiveDirectory` module comes with the `Get-ADUser` commandlet that provides useful information about a user, but the default output does not include some of the properties that I find most useful. Therefore, it requires the returned User object to be piped to `Select-Object` with the desired properties specified like so: `Get-ADUser john.doe | Select-Object Department, Title, LockedOut`. If you know which properties you want on a regular basis, consider adding this function (or similar) to your PowerShell profile.
<!-- more -->
This function specifies the properties I tend to look for with an AD user in order to add context:
* Department
* Title
* Manager
* Office
* LockedOut
* officePhone
* telephoneNumber

{% gist e083d90a45da2b05d77964dfd8e6297a %}

Here are some examples of using this function:
* Say that you know the user's username, then you can simply pass that as an argument like so:
	`Get-Employee john.doe`

* Say that you don't know the user's username, but you know their lastname, you can filter for all users by email address (using the ProxyAddresses property in AD) like so:
  `Get-Employee -ProxyAddressesFilter "doe"`
