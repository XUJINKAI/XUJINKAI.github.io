---
layout: index
permalink: /posts/
title: 博文列表
component: markdown
sidebar: tags
---
<style type="text/css">
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
    color: gray;
  }
  .post-date {
    margin-right: 0;
  }
  .display-icon {
    display: inline-block;
    width: 1.1em;
    text-align: center;
  }
  .emoji-tag {
    font-size: .8em;
    min-width: 1.5em;
    white-space: nowrap;
    display: inline-block;
    text-align: right;
  }
  @media(max-width: 1024px) {
    .emoji-tag {
        display: inline;
    }
  }
  .post-title {
    background-color: white;
  }
  body{
    overflow-y: scroll;
  }
  .update-time {
    font-size: small;
    font-weight: 100;
    color: gray;
  }
  .tag-info {
    font-size: small;
    font-weight: 100;
    position: absolute;
    right: 0;
  }
  .tag-info a {
    color: gray;
  }
</style>

<ul class="list-unstyled" id="posts-archive-list">
    {% for post in site.posts %}
      <li tags="{%for tag in post.tags%}{{tag}} {%endfor%}" class="hide">
        <span class="display-icon mobile-hidden">
          {% if post.display == "sticky" %}📌
          {% elsif post.display == "hide" %}#
          {% else %}
          {% endif %}
        </span>
        <span class="mobile-hidden post-date">{{ post.date | date:"%Y-%m-%d" }}</span>
        <span class="emoji-tag">{{ post.emotag }}</span>
        <a href="{{ post.url }}" class="post-title">
          <span>{{ post.title }}</span>
        </a>
        {% if post.update %}<span class="update-time">更新于 {{ post.update | date:"%Y-%m-%d" }}</span>{% endif %}
        {% if site.disqus %}<span class="disqus-comment-count" data-disqus-identifier="{{post.url}}"></span>{% endif %}
        <span class="tag-info mobile-hidden">{% for tag in post.tags %}{% if tag != "" %}
        <a class="tag" href='javascript:toggle_tag("{{tag}}");'>{{tag}}</a>
        {% if forloop.index != post.tags.size %}, {% endif %}{% endif %}{% endfor %}</span>
      </li>
    {% capture year %} {{ post.date | date: '%Y' }} {% endcapture %}
    {% capture nyear %} {{ post.previous.date | date: '%Y' }} {% endcapture %}
    {% if year != nyear %}<br>
    {% endif %}
  {% endfor %} 
</ul>
{% if site.disqus %}
<script id="dsq-count-scr" src="//{{site.disqus}}.disqus.com/count.js" async></script>
{% endif %}