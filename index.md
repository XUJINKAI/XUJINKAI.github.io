---
layout: index
title: 主页
component: markdown
sidebar: bio
---
<style type="text/css">
.markdown-body a {
	font-weight: 400;
}
</style>

<div>
  {% for post in site.posts limit: 5 %}
  <h1><a href="{{post.url}}">{{post.title}}</a></h1>
  <p>{{ post.date | date:"%Y-%m-%d" }}</p>
  <p>{{post.excerpt | strip_html | truncate: 140}}</p>
  {% endfor %}

  <h2><a href="/posts" style="">>> 查看全部博文...</a></h2>
</div>