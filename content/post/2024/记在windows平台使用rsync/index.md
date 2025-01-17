---
title: "Windows平台也要用Rsync!"
description: 你知道的,GUI部署文件真的很痛苦
date: 2024-08-27T09:38:58Z
slug: ae650ec1
image: 
math: 
license: 
hidden: false
comments: true
categories:
  - tech
tags:
  - rsync
  - windows
draft: false
---

### 2024.9.14 更新

貌似这样装的rsync使用 windows 自带的 openssl 会有写奇怪的问题,最后还是选择安装了 choco 的 rsync

https://community.chocolatey.org/packages/rsync

---

## 前言

实际上写这篇文章的时候距离我配置rsync可能已经过了一万年,完全不记得细节了..所以以下的内容都是基于回忆写成的,可能存在部分不准确之处.

## 参考

[https://qiita.com/clvth14/items/5a7eb26ddca49b7f57c2]
[https://gist.github.com/radleta/0b337a2b14f761951cf2aab0578512b9]

## 正式开始!

1. 先安装zstd

这一步是可选的,大部分Windows的解压软件是自带这个功能的,可以考虑手动部署二进制文件就不需要这个了.但我仍然建议按照教程安装

简单来说,去 [https://github.com/facebook/zstd/releases] 这里下载二进制,然后加入环境变量 (PATH 或者 .bashrc)

2. 下载Rsync二进制

去(这里)[http://repo.msys2.org/msys/x86_64/]下载压缩包,注意是`rsync-〇〇〇–〇-x86_64.pkg.tar.zst` 格式的.

然后使用以下的命令解压缩

```bash
zstd -d rsync-3.2.7-2-x86_64.pkg.tar.zst 
tar -xvf rsync-3.2.7-2-x86_64.pkg.tar
```

把解压出来的exe文件放到环境变量,或者直接放入 `C:\Program Files\Git\usr\bin` 文件夹 (这样仅限于gitbash方便调用)

3. 补齐必须的dll文件

同样的,去[http://repo.msys2.org/msys/x86_64/]下载对应的文件,解压缩放入环境变量

`libzstd-1.5.2-2-x86_64.pkg.tar.zst`
`libxxhash-0.8.1-1-x86_64.pkg.tar.zst`
`libopenssl-3.0.7-2-x86_64.pkg.tar.zst`

**大功告成!**