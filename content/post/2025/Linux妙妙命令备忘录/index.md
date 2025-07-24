---
title: "Linux妙妙命令备忘录"
description: 
date: 2025-07-24T11:41:27+08:00
slug: 3f205a3c
image: 
math: 
license: CC BY-NC 4.0
hidden: false
comments: true
categories:
tags:
draft: false
---

## 查看IP地址

```bash
hostname -I
```

## 批量修改拓展名

```bash
for file in *.txt; do
    mv "$file" "${file%.txt}.md"
done
```

## CRLF改为LF

需要安装`dos2unix`工具。

```bash
find . -type f -exec dos2unix {} +
```