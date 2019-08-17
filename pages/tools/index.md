---
permalink: /tools/
title: 常用工具
comment: true
drawer-close: false
sidebar: toc fixed
layout: index
component: markdown anchor
---

# 常用工具软件

子目录：

- [编程工具](/tools/program)

## 日常

Chrome [https://www.google.com/chrome/](https://www.google.com/chrome/)

> 以默认用户启动 --profile-directory=Default
>
> 以其他用户启动 --profile-directory="Profile 2"
>
> 离线包下载地址 <https://www.google.com/chrome/?standalone=1>

WinRAR [https://www.rarlab.com/download.htm](https://www.rarlab.com/download.htm)

Potplayer [https://potplayer.daum.net/](https://potplayer.daum.net/)

## 小工具

OneQuick 热键工具 [微软商店](https://www.microsoft.com/store/apps/9pfn5k6qxt46) 官网 [https://onequick.org/](https://onequick.org/)

Snipaste 截图 [微软商店](https://www.microsoft.com/store/apps/9p1wxpkb68kx) [https://www.snipaste.com/](https://www.snipaste.com/)

Listary [http://www.listary.com/](http://www.listary.com/)

## 文档

Office 365 <https://stores.office.com/myaccount/home.aspx>

PDF Reader <https://get.adobe.com/cn/reader/]>

## 社交

微信 <https://pc.weixin.qq.com/>

QQ\(商店\) [https://www.microsoft.com/zh-cn/p/qq/9wzdncrfj1ps](https://www.microsoft.com/zh-cn/p/qq/9wzdncrfj1ps)


# 改造系统

## 在右键菜单添加“使用cmd打开”

按住shift还会显示"打开cmd(管理员权限)"

```reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd]
@="Open CMD here"

[HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd\command]
@="cmd.exe /s /k pushd \"%V\""


[HKEY_CLASSES_ROOT\Directory\Background\shell\runas]
@="Open CMD here (as Admin)"
"Extended"=""
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas\command]
@="cmd.exe /s /k pushd \"%V\""
```

## 删除右键菜单中的“使用Visual Studio打开”

```reg
Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\Directory\Background\shell\AnyCode]

[-HKEY_CLASSES_ROOT\Directory\shell\AnyCode]
```