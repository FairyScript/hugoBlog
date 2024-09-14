---
title: "在linux上交叉编译需要gcc的go程序"
description: 
date: 2024-09-06T11:21:43+08:00
slug: 63e1cdb6
image: 
math: 
license: 
hidden: false
comments: true
categories:
  - tech
tags:
  - go
  - golang
  - windows
  - linux
  - gcc
draft: false
---

## 参考

https://studygolang.com/topics/15781?fr=sidebar

https://wiki.eryajf.net/pages/52d983/#_2-linux-%E7%8E%AF%E5%A2%83%E7%BC%96%E8%AF%91


## 正文

先装好

```sh
mingw-w64
libz-mingw-w64
```

```sh
#!/bin/sh
export CGO_ENABLED=1
export GOOS=windows
export GOARCH=386
export CC=i686-w64-mingw32-gcc
export CXX=i686-w64-mingw32-g++
go build -ldflags '-s -w -H=windowsgui'
```