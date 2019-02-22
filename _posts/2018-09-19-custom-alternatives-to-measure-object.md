---
layout: post
title:  "Custom Alernatives to Measure-Object"
date: 2018-09-19 16:19 -0400
dateupdated:   2018-07-11 10:52:02 -0400
categories: powershell pipeline measure-object 
---

## {{ page.title }}
PowerShell provides a built-in method for most objects to count the number of items in that object. Also, PowerShell comes with the Measure-Object commandlet. But, what if those don't quite suit your needs and you want to be able to pipe an object to a single function to do the work for you? Read on to see a few alternatives to .Count and Measure-Object.
<!-- more -->
{% gist f4d653f0e847e6c0ea5bc79b0eb1a26f %}
{% gist 6910da8e1af17511b58c8e013797be1a %}
{% gist 2920251a81f393884c2bd96f9483926c %}
