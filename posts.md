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
.mobile-hidden {
  display: inline;
}
@media(max-width: 1024px){
  .mobile-hidden{
    display: none !important;
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
  .post-date {
    margin-right: 1em;
  }
  .display-icon {
    display: inline-block;
    width: 1.1em;
    text-align: center;
  }
  .emoji-tag {
    font-size: .8em;
  }
</style>

<ul class="list-unstyled" id="posts-archive-list">
    {% for post in site.posts %}
      <li tags="{%for tag in post.tags%}{{tag}} {%endfor%}">
        <span class="display-icon mobile-hidden">
          {% if post.display == "sticky" %}📌
          {% elsif post.display == "hide" %}#
          {% else %}
          {% endif %}
        </span>
        <span class="mobile-hidden post-date">{{ post.date | date:"%Y-%m-%d" }}</span>
        <a href="{{ post.url }}">
          <span>{{ post.title }}</span>
        </a>
        <span class="emoji-tag">{{ post.emotag }}</span>
        <span class="disqus-comment-count" data-disqus-identifier="{{post.url}}"></span>
      </li>
    {% capture year %} {{ post.date | date: '%Y' }} {% endcapture %}
    {% capture nyear %} {{ post.previous.date | date: '%Y' }} {% endcapture %}
    {% if year != nyear %}<br>
    {% endif %}
  {% endfor %} 
</ul>
<script id="dsq-count-scr" src="//xujinkai.disqus.com/count.js" async></script>
