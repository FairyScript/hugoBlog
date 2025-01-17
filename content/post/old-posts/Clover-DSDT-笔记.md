---
title: Clover DSDT 笔记
sage: true
abbrlink: f1ba07a0
date: 2018-10-30 20:16:12
tags:
  - 技术笔记
  - 黑苹果
  - DSDT
---

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=30148963&auto=1&height=66"></iframe>

​	本文是我在研究黑苹果DSDT期间所做的技术笔记，可读性会很差，建议善用搜索功能。

​	Clover修正DSDT的方式主要有两种：Patched 与 hotpatch。hotpatch主要是对原有的属性进行修正，而patched相当于为电脑添加了新的属性。故两者不能混淆。

​	Clover对DSDT热修补(hotpatch)的大致思路是将现有的需要修正的DSDT进行「重命名」，然后制作一个自定的DSDT文件（.aml)。将系统原生的DSDT访问指向自定的文件，然后就可以做到自定义指定DSDT的行为，此处举例：

```
Comment: Rename _DSM to XDSM
Find: <5f44534d>
Replace: <5844534d>
```

注：「_DSM」转为Hex写作<5f44534d>

将系统原生的 _DSM 访问重定向至 XDSM，配合/clover/acpi/hotpatch下的.aml文件就可以拦截处理指定的DSDT。

未完待续……
