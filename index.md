---
layout: default
---

<button id="collapse-all" class="collapse_all">Collapse All</button>

# Cool Things :)

## PowerShell

<details>
<summary>Set Lync Client Personal Message by Day of the Week</summary>
I have 3-year-old daugther and she has nicknames for the days of the week. I thought it would be a fun little challenge to come up with a way to automatically change my Lync personal message to use one of those nicknames based on the current day of the week.
  <details class="indent">
  <summary>Code</summary>
  {% gist d4e337435dd5a9d5722b21a9145eb353 %}
  </details>
</details>
<hr/>

## Bash
<details>
<summary>Set Pihole DNS Server based on Current Network</summary>
A bash script that allows me to pre-configure my work and home private network address ranges so that I can easily change the upstream DNS server basd on which network I'm currently on. This way I can access local resources at work via their domain name while still getting the benefits of Pihole running in a docker container.
  <details class="indent">
  <summary>Code</summary>
  {% gist bd2a9a9f83169f1232af4296a60a993b %}
  </details>
</details>
