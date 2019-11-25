---
permalink: /tools/program/dotnet/
title: .Net 相关
comment: true
drawer-close: false
sidebar: toc fixed
layout: index
component: markdown anchor
---

# .Net 相关

## [Visual Studio](https://visualstudio.microsoft.com/zh-hans/downloads/)

- [Microsoft Code Analysis 2019](https://marketplace.visualstudio.com/items?itemName=VisualStudioPlatformTeam.MicrosoftCodeAnalysis2019) 代码分析工具

- [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.VSIntelliCode) 基于AI的代码提示工具

- [XML Comments](https://marketplace.visualstudio.com/items?itemName=UwePhilipps.XMLComments) 为函数生成及更新 **/// <Summary>** 注释。

## [dotnet core](https://dotnet.microsoft.com/download)

- [如何生成单一exe文件](/posts/dotnet-publish-single-file)

- [dotnet-script](https://github.com/filipw/dotnet-script) 以脚本的方式运行dotnet，且支持REPL（写一句执行一句）

- [dotnet-serve](https://github.com/natemcmaster/dotnet-serve) 简易http服务，伺服任意文件夹，还支持https

### 代码覆盖率工具

- [coverlet](https://github.com/tonerdo/coverlet)

- [ReportGenerator](https://github.com/danielpalme/ReportGenerator)

coverlet和ReportGenerator配合生成测试覆盖率报告，[这里](/posts/test-coverage-in-dotnet)有详细介绍。

## 开源项目

- [XAML Controls Gallery](https://www.microsoft.com/en-us/p/xaml-controls-gallery/9msvh128x2zt) 微软官方出品的XAML控件展示软件，并且是[开源](https://github.com/Microsoft/Xaml-Controls-Gallery/)的

## NuGet 包

- [CommandDotNet](https://bilal-fazlani.github.io/commanddotnet/) 创建命令行工具的利器，自动把类中的函数转化为各种命令

- [Colorful.Console](http://colorfulconsole.com/) 让控制台输出彩色字符

- [ObjectDumper](https://github.com/thomasgalliker/ObjectDumper) 格式化输出object的属性，调试利器

- [NSubstitute](https://nsubstitute.github.io/) 模拟框架，给一个接口就能上天

- [Nancy](https://github.com/NancyFx/Nancy) 轻量级网络框架，尤其适合打造API

- [Newtonsoft.Json](https://www.newtonsoft.com/json) 超多项目都用他，解析以及序列化json不二选择(dotnet core 3.0已有内置的json库)
