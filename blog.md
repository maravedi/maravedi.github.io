---
layout: default
title: Posts 
permalink: /blog/
---

<ul>
	{% for post in site.posts %}
		Date Posted: {{ post.date | replace: "-0400","EST" }}
		<br/>
		Date Updated: {% if post.update %} {{ post.update }} {% else %} {{ post.date | replace: "-0400","EST" }} {% endif %}

		<br/>
		<span class="read-time" title="Estimated read time">
		  <svg id="i-clock" viewBox="0 0 32 32" width="20" height="20" fill="none" stroke="currentcolor" stroke-linecap="round" 
  stroke-linejoin="round" stroke-width="2"><circle cx="16" cy="16" r="14" /><path d="M16 8 L16 16 20 20" /></svg>       

		  {% assign words = post.content | number_of_words %}
		  {% if words < 360 %}
		    1 min read.
		  {% else %}
		    {{ words | divided_by:180 }} min read.
		  {% endif %}
		</span>
		<style>
		    svg#i-clock {vertical-align: middle;}
		</style>
		<br/>
		<a href="{{ post.url }}" style="color: inherit;"><h2>{{ post.title }}</h2></a>
		{{ post.excerpt | strip_html | replace_first: post.title, '' }}
		<br/>
		<a href="{{ post.url }}" style="text-decoration: none; color: inherit;"><b>Read more...</b></a>
		<hr/><br/>
	{% endfor %}
</ul>
