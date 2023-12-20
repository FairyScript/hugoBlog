---
title: 'React生态观察 2023年12月篇'
description:
date: 2023-12-13T17:15:52+08:00
slug: a2d31c0e
image:
math:
license:
categories:
  - 技术笔记
tags:
  - React
  - Typescript
hidden: false
comments: true
---

## zod

[zod](https://github.com/colinhacks/zod) 是一个蛮有意思的类型检查库, 补全了 typescript 无法运行时检查的一些不足, 同时还提供了一些转换功能. 但目前来说对于 function 类型存在一些 args 推导方面的问题.

## Biome

[Biome](https://github.com/biomejs/biome) 一个集成了类型检查 + 格式化的代码审查工具. 特色是用 rust 写的所以速度飞快. 但目前对规则的支持还不足以满足我项目的需求.
观望中.

### 2023-12-18 更新

最近发现了一个类似的工具 [oxc](https://github.com/oxc-project/oxc). 同样加入关注列表.
