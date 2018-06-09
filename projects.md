---
layout: default
title: Projects
permalink: /projects/
---


<!--
<details><summary>Gist</summary><p>
{% gist 52734cd74f56ea2a821e64db793d797c %}
</p></details>
-->

<button id="collapse-all" class="collapse_all">Collapse All</button>

# Projects

## Security
<details><summary><b>SecurityCenter</b></summary>
<p>Two Python scripts to add email notifications to SecurityCenter's ticketing system. The first is a Python script that identifies any newly assigned tickets in SecurityCenter and sends and email to the assignees. The second is a Python script that sends out reminder emails to the assignees of any ticket that remains open for a specified period of time. Both of these scripts build upon the <a href="https://github.com/SteveMcGrath/pySecurityCenter">pySecurityCenter</a>  module written by SteveMcGrath, and were both merged with the project as examples.</p>
</details>
<details><summary><b>Terminated Users Audit</b></summary>
<details class="indent"><summary>Active Directory</summary>
A PowerShell script that combines data from the HRMS, IT Ticketing System, and Active Directory to indentify accounts that have not been deactivated after termination.
</details>
<details class="indent"><summary>Office 365 Licenses</summary>
A PowerShell script that identifies Office 365 licenses that were not revoked from terminated employees. When I introduced this particular script, it saved the organization about $1,400/month in the amount of licenses that were able to be recycled.
</details>
</details>

<hr/>

## System Patching and Hardening
<p>
<details><summary><b>WSUS</b></summary>
<details class="indent"><summary>WSUS Initial Server Configuration</summary>
A PowerShell script to bootstrap the initial configuration of a downstream replica WSUS server.
</details>
<details class="indent"><summary>WSUS Restart PendingReboot Clients</summary>
A PowerShell script that queries all WSUS clients that have a pending reboot, and triggers a remote reboot of each of them. Typically restarts are controlled through Group Policy, but this method gives the user more control over when the computer reboots. If a computer has a pending reboot, then the user can postpone it indefinitely until this script catches it (it's best to have this script run very early in the morning, like 4 a.m.). The alternative was that eventually the computer would do a force reboot after the user postpones it enough times.
</details>
</details>
</p>
<p>
<details><summary><b>Server Status</b></summary>
A PowerShell script that pings, checks the uptime, and displays any pending Windows Updates in a single HTML file.
</details>
</p>
<p>
<details><summary><b>Configuration Scripts</b></summary>
<details class="indent"><summary>CVE-2017-8529</summary>
A PowerShell script to modify a registry setting to protect the system from CVE-2017-8529.
</details>
</details>
</p>
<hr/>

## System Availability
<details><summary><b>Server Memory Monitoring</b></summary>
A PowerShell script that remotely checks performance counters over a period of time with a specified sampling interval. All data is collected in a SQLite database for later analysis. In this particular instance, if the current memory utilization exceeds a threshold, and it is not during business hours, the script will also trigger a forced reboot.
</details>
<details><summary><b>Server CPU Monitoring</b></summary>
A PowerShell script that remotely checks performance counters over a period of time with a specified sampling interval. All data is collected in a SQLite database for later analysis. This particular case was intended for monitoring systems prior to an update that was reported to cause CPU spikes. This allowed us to monitor the performance priot to the update and after the update to see if our systems were affected by this bug.
</details>

<hr/>

## Data Transfer
<details><summary><b>File Duplication</b></summary>
<p>A set of scripts to ensure that any file present in one directory is also present in a second directory. One is a PowerShell wrapper around Robocopy, the other is a script that independently monitors the two directories to ensure that no files that are expected in the destination directory are missing. If files are missing after a certain period of time, the initial Robocopy wrapper script is restarted.</p>
<p>This particular script came about as a last-minute solution to an integration hurdle for a new device in the organization. The on-site consultants were unable to develop a solution for this problem, but with my help this enabled the integration to continue. Due to the importance of this process, I added additional checks to also monitor all scheduled tasks, and if any are not in the running state, then it automatically restarts the task and then notifies me of the actions taken.</p>
</details>
<details><summary><b>Photo Import for Active Directory and O365</b></summary>
A PowerShell script that identifies any active employees in Active Directory that do not have a value set for the thumbnailPhoto property. For those identified accounts, it then pulls their badge photo from the badging system so that the thumbnailPhoto can be populated with it. Prior to updating the property in Active Directory, the script dynamically adjusts the size of the photo so that it fits within the file size restrictions for a thumbnailPhoto in Active Directory.
</details>

<hr/>
