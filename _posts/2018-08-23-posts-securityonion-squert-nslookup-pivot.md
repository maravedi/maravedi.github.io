---
layout: post
title: _posts/securityonion-squert-nslookup-pivot
date: 2018-08-23 10:39 -0400
---

## Adding an nslookup pivot to Squert
If you've ever used [Security Onion][securityonion], you've undoubtedly used Squert. Squert is a web interface for managing events in Security Onion. Each event must have a source and a destination IP address, by nature. And this is how they are displayed in Squert, by IP address. What if you want to know what the hostnames are, though?
<!-- more -->

For one-off situations, it's pretty easy to pop open a terminal and run nslookup on the IP address you're interested in. But wouldn't it be much easier to click on the IP address in Squert and then perform the lookup without having to take your hand off the mouse? Well, grab a hoodie and get ready to hack together a quick solution for just that.

First, we have to figure out how to create a new pivot option in Squert. Thankfully, the instructions for this are provided in the Security Onion documentation:
> ### Adding your own pivots
>If you're running the latest version of Squert, you can also add your own pivots as follows:
>
> * In the upper right corner of Squert, click the Filters button.
> * Set the type to URL.
> * Click the + button.
> * Click your New entry.
> * Fill out the alias, name, notes, and URL fields as applicable.
> * Click the Update button.
> * Close the Filters and URLs window.
> * To test, drill into an event and click an IP address. A context menu will appear and display your new link. Click the new link and verify that it opens a new browser tab going to the site you specified and passing the IP address that you clicked on.
>
> *Source: https://github.com/Security-Onion-Solutions/security-onion/wiki/Squert*

As the instructions above show, we need to create the filter using a URL. So that brings up the question: How can we get the hostname of an IP address using a URL? Good news, it's quite trivial to do using PHP. We're going to make a GET request to the server, and translate the IP address to its corresponding hostname on the backend. So, in the URL section of the filter, we need to add a GET parameter for the IP address in the URL like this: `https://so.contoso.com/nslookup.php?IP=${var}`

So here's what the filter looks like, with the actual code below. Make sure to replace "so.contoso.com" with the fully qualified domain name of your Security Onion server.

### New Squert Filter
![New Squert Filter]({{ "/assets/images/Squert_NsLookup_Filter.png" | absolute_url }})

### JSON for New Squert Filter
{% gist 0f9f9dceb6778503d85f1c1092122caf %}

For this solution, we're going to use PHP since that's part of the web stack that's being used by Security Onion anyway. So we need to create a new page for this filter to make the GET request to. To make things easy, we can just create a new PHP file in the web root that the Security Onion server serves up by default: `/var/www/so`

So, create a new file in `/var/www/so` named `nslookup.php`. Open it up with your favorite editor and add the code below to it:

### PHP Code for nslookup through GET Request
{% gist 43a94345cf7b8534f3743a05dcbc567d %}

In short, what we're doing here is getting the GET request parameter `IP` and validating it to be certain it is an IP address. If it passes that validation, then we're just returning the result of resolving that IP address using the `gethostbyaddr` [PHP function][gethostbyaddr].

With the filter in place and the new `nslookup.php` page in place, we're ready to try out our new pivot. Head over to Squert and find an event and click on an IP address and you'll see the *NsLookup* option now. Click that and your new `nslookup.php` page will open in a new tab. If the address can be translated, it'll show you the hostname!

### Squert nslookup Pivot Example
![Squert Pivot]({{ "/assets/images/Squert_NsLookup_Interface.png" | absolute_url }})

### Squert nslookup Result
![Squert NsLookup]({{ "/assets/images/Squert_NsLookup_Output.png" | absolute_url }})

[securityonion]: https://securityonion.net/
[gethostbyaddr]: http://php.net/manual/en/function.gethostbyaddr.php
