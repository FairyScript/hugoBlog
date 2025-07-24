---
title: "2025.03新的win11跳过OOBE联网"
description: 
date: 2025-03-31T13:58:12+08:00
slug: bf59ca16
image: 
math: 
license: CC 0
hidden: false
comments: true
categories:
  - tech
tags:
  - windows 11
  - OOBE
  - 联网
---

前段时间微软删除了在安装过程中使用 `oobe/bypassnro.cmd` 跳过强制联网注册的方法.现记录一个新的,更快而且不需要重启

在安装界面按下 `Shift + F10` 打开 cmd, 在里面输入 `start ms-cxh:localonly` 回车执行.

EOF