---
layout: post
title:  "Configuring a DSC Pull Server with HTTPS"
date:   2018-07-11 10:52:02 -0400
dateupdated:   2018-07-11 10:52:02 -0400
categories: powershell dsc pullserver https 
---

## Configuring a DSC Pull Server with HTTPS on Windows Server Core 2016
After learning about DSC Pull Servers, I immediately wanted to get one up and running, however, I tend to want to do things right the first time if I can. That being said, I didn't want to create a pull server with SMB to test, and then one with HTTP, and then one with HTTPS after. I knew I wanted HTTPS to start with, so I set out to do just that. Things quickly became complicated because I decided to do this on Windows Server Core 2016...
<!-- more -->

Unfortunately, the official documentation only mentions that HTTPS can be configured for a pull server, but it doesn't detail how to do it. Thankfully, I came across [Josh Duffney's blog][duffney.io] where he does go into detail about [how to set up a pull server using HTTPS][duffney-dsc-https-post]. The only thing missing, though, is getting the cert and importing it into the pull server. I haven't had to do mess with certs in a Windows environment much, so it took me a little bit to figure it out. Hopefully this will help someone else too.

Part of the complication with my attempt was that I decided to go with Windows Server 2016 Core. This meant that I couldn't follow all the usual guides on how to make a certificate request from the domain CA. And even after trying several different methods of doing this through PowerShell and with certreq, I could not get it working right. What did work for me was making the request through MMC on another server as that local machine, and putting in all the appropriate attributes. Once I did that, I was able to export the certificate and private key from the requesting server as a .pfx file. Once I had the certificate and private key in the form of a .pfx file, I was able to import them into the DSC pull server using the [Import-PfxCertificate][import-pfxcertificate] module in PowerShell.

From then on, I was able to follow [Josh Duffney's blog post][duffney-dsc-https-post] on configuring the DSC pull server.

If, by chance, you ran the DSC config before with a different certificate, you may run into an issue where the web server isn't serving the site properly. To fix this, just remove it by running this (assuming you followed [Josh Duffney's blog post][duffney-dsc-https-post]): Remove-Website -Name PSDSCPullServer. After that, you can run the DSC config again with the correct certificate and it will re-build it properly.

[duffney.io]: https://duffney.io
[duffney-dsc-https-post]: https://duffney.io/Configure-HTTPS-DSC-PullServerPSv5
[import-pfxcertificate]: https://docs.microsoft.com/en-us/powershell/module/pkiclient/import-pfxcertificate?view=win10-ps
