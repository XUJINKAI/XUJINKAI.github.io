---
layout: post
published: true
comment: true
permalink: 
title: 让navbar对移动端更友好
tags: css
date: 2016-03-24 18:12:33 +0800
---
利用bootstrap可以轻松让导航条固定在顶部，并且在移动端上折叠。  
但是在移动端上固定的导航条会遮挡视野，默认的下拉菜单也不够美观。

从这里<http://note.rpsh.net/>{:target="_blank"}学来一招，让移动端中的导航条不再固定，并且折叠菜单更美观，不再占用大半个屏幕。

<!--more-->
```css
.navbar {
	position: fixed;
	width: 100%;
	height: 20px;
	z-index: 20;
	border-radius: 0;
	background-color: rgba(0, 0, 0, 0.87);
	border-color: rgba(255, 255, 255, 0);
}

@media (max-width: 768px) {
	.navbar {
		position: static;
	}
	div .navbar-collapse {
	    position: absolute;
	    background-color: rgba(0, 0, 0, 0.90);
	    z-index: 20;
		width: 170px;
	    right: 30px;
	}
	.content {
		padding-top: 0px;
	}
}

@media (min-width: 769px) {
	.content {
		padding-top: 60px;
	}
}
```
其中.content是正文所属的class。  

具体效果改变本站窗口大小就能看到。  
