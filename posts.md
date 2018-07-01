---
layout: index
permalink: /posts/
title: 博文列表
component: markdown
sidebar: tags
---
<style type="text/css">
.main-container {
  margin-top: 32px;
}
ul.list-unstyled#posts-archive-list{
  padding-left: 0;
}
div.post-prefix {
  display: inline;
}
@media(max-width: 1024px){
  div.post-prefix{
    display: none;
  }
}
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
    list-style: none;
  }
  #posts-archive-list li .disqus-comment-count{
    font-size: .8em;
  }
  .display-icon {
    display: inline-block;
    width: 2em;
    text-align: center;
  }
</style>

<ul class="list-unstyled" id="posts-archive-list">
    {% for post in site.posts %}
      <li tags="{%for tag in post.tags%}{{tag}} {%endfor%}">
        <div class="post-prefix">
          <span>{{ post.date | date:"%Y-%m-%d" }}</span>
          <span class="display-icon">
            {% if post.display == "sticky" %}📌
            {% elsif post.display == "hide" %}🙈
            {% else %}&raquo;
            {% endif %}
          </span>
        </div>
        <a href="{{ post.url }}">
          <span>{{ post.title }}</span>
          <span class="disqus-comment-count" data-disqus-identifier="{{post.url}}"></span>
        </a>
      </li>
  {% endfor %} 
</ul>
<script id="dsq-count-scr" src="//xujinkai.disqus.com/count.js" async></script>
