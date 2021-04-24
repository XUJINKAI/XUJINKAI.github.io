---
layout: index
title: 主页
component: markdown
sidebar: bio
---
<style type="text/css">
#recent-posts>*:first-child {
    margin-top: 0 !important;
}
.markdown-body a {
	font-weight: 400;
}
.sticky-symbol {
	font-size: 16px;
}
.emotag {
	padding-left: 8px;
	font-size: .8em;
}
.post-info {
	margin-bottom: 10px !important;
}
.date-time {
}
.update-time {
	text-decoration: underline;
}
</style>

<div id="recent-posts">
{% assign sticky_posts = site.posts | where: "display","sticky" %}
{% for post in sticky_posts %}
	<h1 class="sticky-header">
		<a href="{{post.url}}"><span class="sticky-symbol">📌{{ post.emotag }}</span> {{post.title}}</a>
	</h1>
	<p>{{post.excerpt | strip_html | truncate: 70}}</p>
{% endfor %}
{% assign count = 0 %}
{% for post in site.posts %}
	{% assign show = false %}
	{% if post.display %}{% if post.display == "normal" %}{% assign show = true %}{% endif %}
	{% else %}{% assign show = true %}
	{% endif %}
	{% if show == false %}{% continue %}{% endif %}
	{% assign show = false %}
	{% assign count = count | plus: 1 %}
	{% if count <= 10 %}{% assign show = true %}{% endif %}
	{% if post.emotag %}{% assign show = true %}{% endif %}
	{% if show == false %}{% continue %}{% endif %}
	<h1><a href="{{post.url}}">{{post.title}}</a></h1>
	<p class="post-info">
	{% if post.update %}
	<span class="update-time" title="创建于 {{ post.date | date:"%Y-%m-%d" }}">{{ post.update | date:"%Y-%m-%d" }}</span>
	{% else %}
	<span class="date-time">{{ post.date | date:"%Y-%m-%d" }}</span>
	{% endif %}
	<span class="emotag">{{ post.emotag }}</span>
	</p>
	<p>{{post.excerpt | strip_html | truncate: 140}}</p>
{% endfor %}

<h2><a href="/posts" style="">>> 查看全部博文...</a></h2>
</div>