---
layout: index
title: 主页
component: markdown
sidebar: bio
---
<style type="text/css">
.main-container {
	margin-top: 2em;
}
#recent-posts>*:first-child {
    margin-top: 0 !important;
}
.markdown-body a {
	font-weight: 400;
}
.markdown-body p.sticky-header {
	font-size: 2em;
	margin-top: 32px
}
.sticky-text {
	font-size: 16px;
}
</style>

<div id="recent-posts">
{% assign sticky_posts = site.posts | where: "display","sticky" %}
{% for post in sticky_posts %}
	<p class="sticky-header"><a href="{{post.url}}"><span class="sticky-text">📌</span> {{post.title}}</a></p>
{% endfor %}
{% assign count = 0 %}
{% for post in site.posts %}
	{% assign show = false %}
	{% if post.display %}{% if post.display == "normal" %}{% assign show = true %}{% endif %}
	{% else %}{% assign show = true %}
	{% endif %}
	{% if show == true %}
	{% assign count = count | plus: 1 %}
	{% if count <= 5 %}
	<h1><a href="{{post.url}}">{{post.title}}</a></h1>
	<p>{{ post.date | date:"%Y-%m-%d" }}</p>
	<p>{{post.excerpt | strip_html | truncate: 140}}</p>
	{% endif %}
	{% endif %}
{% endfor %}

<h2><a href="/posts" style="">>> 查看全部博文...</a></h2>
</div>