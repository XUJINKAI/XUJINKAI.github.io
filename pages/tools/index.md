---
permalink: /tools/
title: 常用工具
comment: true
drawer-close: false
sidebar: toc fixed
layout: index
component: markdown anchor
---

# 常用工具

子目录：

- [开发工具](/tools/program)

    - [.Net相关](/tools/program/dotnet/)

## 日常

Chrome <https://www.google.com/chrome/>

> 以默认用户启动 --profile-directory=Default
>
> 以其他用户启动 --profile-directory="Profile 2"
>
> 离线包下载地址 <https://www.google.com/chrome/?standalone=1>

Edge(Chromium) <https://www.microsoftedgeinsider.com/en-us/>

WinRAR <https://www.rarlab.com/download.htm>

Potplayer <https://potplayer.daum.net/>

## 小工具

OneQuick 热键工具 <https://onequick.org/>, [微软商店](https://www.microsoft.com/store/apps/9pfn5k6qxt46)

Snipaste 截图工具 <https://www.snipaste.com/>, [微软商店](https://www.microsoft.com/store/apps/9p1wxpkb68kx)

Listary <http://www.listary.com/>

## 文档

微软必应词典 (Win10) <https://www.microsoft.com/zh-cn/p/%e5%be%ae%e8%bd%af%e5%bf%85%e5%ba%94%e8%af%8d%e5%85%b8-win10/9nblggh63sw0>

OneNote <https://www.microsoft.com/zh-cn/p/onenote/9wzdncrfhvjl>

Office 365 <https://stores.office.com/myaccount/home.aspx>

PDF Reader <https://get.adobe.com/cn/reader/>

## 社交

微信 <https://pc.weixin.qq.com/>

QQ\(UWP\) <https://www.microsoft.com/zh-cn/p/qq/9wzdncrfj1ps>


# 改造右键菜单

```reg

Windows Registry Editor Version 5.00


; Open Command Window Here 在右键菜单添加“使用cmd打开”

[HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd]
@="@shell32.dll,-8506"
"Icon"="C:\\Windows\\System32\\cmd.exe"

[HKEY_CLASSES_ROOT\Directory\Background\shell\RunCmd\command]
@="cmd.exe /s /k pushd \"%V\""


; Open Command Window Here (Administrator) 在shift右键菜单添加“使用cmd打开(Admin)”

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas]
@="Open Command Window Here (Administrator)"
"Icon"="C:\\Windows\\System32\\cmd.exe"
"HasLUAShield"=""
"Extended"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\runas\command]
@="cmd.exe /s /k pushd \"%V\""


; Hide open visual studio command 隐藏右键菜单中的“使用Visual Studio打开”

[HKEY_CLASSES_ROOT\Directory\Background\shell\AnyCode]
"HideBasedOnVelocityId"=dword:00639bc8


; Hide git command 隐藏右键菜单中的git命令

[HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui]
"HideBasedOnVelocityId"=dword:00639bc8

[HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell]
"HideBasedOnVelocityId"=dword:00639bc8

```
