---
layout: index
permalink: /posts/
title: 博文列表
component: markdown
sidebar: tags
---
<style type="text/css">
  .sticky h4 {
    font-size: 26px;
  }
  .sticky {
    font-size: 18px;
    margin-top: 35px;
    margin-bottom: 35px;
  }
  #posts-archive-list li {
    font-size: 18px;
    margin-bottom: 5px;
  }
  #posts-archive-list li .disqus-comment-count{
    font-size: .8em;
  }
</style>

<ul class="list-unstyled" id="posts-archive-list">
    {% for post in site.posts %}
    {% capture year %} {{ post.date | date: '%Y' }} {% endcapture %}
    {% capture nyear %} {{ post.next.date | date: '%Y' }} {% endcapture %}
    {% if year != nyear %}
      <h2>{{ post.date | date: '%Y' }}</h2>
      {% endif %}
      <li tags="{%for tag in post.tags%}{{tag}} {%endfor%}">
        <span>{{ post.date | date:"%Y-%m-%d" }}</span>
        <span>&nbsp;&raquo;&nbsp;</span>
        <a href="{{ post.url }}">
          <span>{{ post.title }}</span>
          <span class="disqus-comment-count" data-disqus-identifier="{{post.url}}"></span>
        </a>
      </li>
  {% endfor %} 
</ul>
<script id="dsq-count-scr" src="//xujinkai.disqus.com/count.js" async></script>
