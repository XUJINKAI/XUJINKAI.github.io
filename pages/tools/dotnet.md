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

**Visual Studio** <https://visualstudio.microsoft.com/zh-hans/downloads/>

无需多说，唯一指定宇宙最强IDE。

**dotnet core** <https://dotnet.microsoft.com/download>


## VS 插件

**XML Comments** <https://marketplace.visualstudio.com/items?itemName=UwePhilipps.XMLComments>

自动为函数生成**/// <Summary>**注释。


## dotnet script

**dotnet-script** <https://github.com/filipw/dotnet-script>

以脚本的方式运行dotnet，且支持REPL（写一句执行一句）

执行`dotnet tool install -g dotnet-script`来安装，然后执行`dotnet script`进入REPL


## 测试覆盖率

**coverlet** <https://github.com/tonerdo/coverlet>

**ReportGenerator** <https://github.com/danielpalme/ReportGenerator>

coverlet和ReportGenerator配合生成测试覆盖率报告，[这里](/posts/test-coverage-in-dotnet)有详细介绍。


## 开源项目

**XAML Controls Gallery** <https://www.microsoft.com/en-us/p/xaml-controls-gallery/9msvh128x2zt>

微软官方出品的XAML控件展示软件，并且是[开源](https://github.com/Microsoft/Xaml-Controls-Gallery/)的。


## NuGet

**Newtonsoft.Json** <https://www.newtonsoft.com/json>

超多项目都用他，解析以及序列化json不二选择

**CommandDotNet** <https://bilal-fazlani.github.io/commanddotnet/>

创建命令行工具的利器，自动把类中的函数转化为各种命令

**Colorful.Console** <http://colorfulconsole.com/>

让控制台输出彩色字符

**ObjectDumper** <https://github.com/thomasgalliker/ObjectDumper>

格式化输出object的属性，调试利器

**NSubstitute** <https://nsubstitute.github.io/>

模拟框架，给一个接口就能上天
