---
title: '记重新安装windows下GPG踩到的坑'
date: 2022-03-30 23:19:45
tags: []
published: true
hideInList: false
feature:
isTop: false
slug: windows-gpg
---

前段时间在新环境上配置 gpg 时,下意识安装了 win4gpg.然后在从 Canokey 导入私钥的时候遇到了 gpg 行为十分怪异的情况.

检查之后发现是因为 windows git ,如果选择使用 git 捆绑的 openSSH 的话,他会自己带一个 gpg.导致和 win4gpg 互相干扰

卸载掉 win4gpg 之后,重新 fetch 卡片就解决了
