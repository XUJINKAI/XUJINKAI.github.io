---
layout: post
published: true
comment: true
sticky: false
permalink: 
title: 打造个性域名邮箱的几个方案
tags: 域名 邮箱
date: 2016-06-16 17:21:07 +0800
---

域名的用处，除了常见的作为网站的网址，还可以拿来做自己的域名邮箱。  

好处是：你从此拥有了无限个马甲邮箱，于是注册网站再也不费劲了，每个网站都用不同的邮箱注册，如果有垃圾邮件还可以根据邮箱地址判断是哪个网站泄露的。  
另外一个显而易见的好处是：拉风！  

要做到这个效果，需要把发送往某个域名的邮件都集中到一个邮箱管理。  
在比较并试用了网上各种方案后，在此列出三个我比较认同的方案。

<!--more-->

### 一、通过域名注册商提供的服务  
某些域名注册商如[Godaddy](https://www.godaddy.com){:target="_blank"}是提供邮件转发服务的，利用这个服务把邮件转发到我们自己的邮箱就行了。  

如godaddy中，找到“我的产品”，点开“workspace邮件”，可以开启免费邮件转发服务。然后去“邮件”页面，设置转发即可（create forward），域名邮箱前边无所谓，只要域名对了就行，然后填入要转发到的地址，最后再把“catch-all”勾上。

**优点**：设置最简单，可以管理多个域名，并且是使用你自己习惯的邮箱管理（如gmail）。  
**缺点**：只能接收无法发送。  

另外，godaddy转发的邮件google提示没有加密，并且有一个很长的“通过secureserver.net转发”的标记，这对我这个“完美主义者”来说是没法忍受的。


### 二、通过企业邮箱进行管理
虽然大家都在吐槽腾讯的[企业邮箱](http://exmail.qq.com){:target="_blank"}，可不得不说我这一圈试用下来，还是腾讯的企业邮箱方便一些，尤其是腾讯企业邮箱跟微信整合的非常完美，这点很不错。如果你不想付费使用[google apps](https://apps.google.com/){:target="_blank"}之类的服务，那免费的腾讯企业邮箱非常值得一试，此外，还有汉化感人的[Zoho](https://www.zoho.com/){:target="_blank"}，没有汉化的[yandex](https://domain.yandex.com/domains_add/){:target="_blank"}等可供选择，这方面搜“企业邮箱”一大把。

注册管理员邮箱后，记得要把“邮件转移”指向管理员邮箱，让这个域名下所有邮件都发到同一个邮箱中。

**优点**：因为是企业邮箱，所以各种管理都很方便，大多还提供免费空间、协同办公等功能，也可以方便的创建账户给别人使用，腾讯的还可以绑定微信。  
**缺点**：大多免费的服务只能绑一个域名，另外具体服务质量就因企业而异了，比如网上很多人说腾讯会收不到邮件（我并没有遇到）。  

腾讯的邮箱没有存档功能，跟qq邮箱的区别就是没有广告。。。虽然还不错，不过作为一个折腾星人，我最终选择了第三个方案。


### 三、Gmail + mailgun 方案
[mailgun](http://mailgun.org){:target="_blank"}并不是上文中提到的企业邮箱，而是面向开发者提供的邮件服务，用于实现网站自动发邮件或回复邮件等功能。

注册mailgun以后，先绑定自己的域名。再去routes设定`catch_all()`, `forward("你的邮箱地址")`，这样所有发往你域名的邮件就都被转到你自己的邮箱中了。

mailgun取消了pop服务器，所以要找一个可以只设定smtp服务的邮箱来发邮件，这时候gmail就出场了。  
先去mailgun的domains，点进你的域名，点Manage SMTP credentials，添加一个你喜欢的邮箱名字，这里密码可以设定的复杂一些，因为只会用到一次。  
然后去gmail，设置中设定发邮件账户，把刚才的smtp账户填进去就行，注意smtp服务器是mailgun的smtp.mailgun.org，不是你的域名。  

这样，你就可以完美用gmail收发自己域名的邮件了，在mailgun中也可以绑多个域名，然后gmail通通帮你搞定。  
这个方案完美的将域名邮箱作为gmail的小号，没有一丝多余。  

要说还有什么不完美，那就是gmail需要翻墙（逃


### 附、域名邮箱有关的DNS设定
要将自己的域名绑到对应的邮箱服务，需要去DNS里设定几条记录，具体内容可以查看相应站点的帮助。  
其中MX记录是必须的，你需要绑定相应的地址，才能正确收到邮件，而且最好把多余的MX记录都删掉。  
为了验证邮件确实是你发的，也最好设置SPF，这个一般的服务商都有提供，是类似于"v=spf1 include:mailgun.org ~all"的TXT记录。像mailgun还会提供DKIM，也是用于验证邮件的，有提供的话需要一并添加到DNS中。  
如果需要使用自己域名的pop、imap、smtp等服务，还要添加相应的CNAME记录。


至此，属于你自己的域名邮箱就完成了，三个方案各有优劣。  
如果你用不到发邮件，只是注册用一下马甲邮箱，也没有强迫症，那第一个方案最合适。  
如果你需要的不仅仅是邮箱，还有一系列企业管理功能和人性化功能，那第二个方案合适。  
如果你经常用gmail，也不需要多一个企业邮箱去管理，那第三个方案最合适。  
除了这三个方案，还可以自己搭邮箱服务器，这个对一般人就不太推荐了，专业的事情还是交给专业的服务比较好。  