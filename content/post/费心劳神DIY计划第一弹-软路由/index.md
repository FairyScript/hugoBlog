---
title: 费心劳神DIY计划第一弹-软路由
description: 我直接修改了默认的post来说明一下为什么自己又重新部署了一遍
slug: '18317079'
date: 2024-03-04 13:31:00+0800
image: cover.jpg
categories:
  - chat
tags:
draft: true

# weight: 1 # You can add weight to some posts to override the default sorting (date descending)
---

前段时间把自己家里的设备重新折腾了一下,顺手写一点记录.

## 缘由

`OpenWrt` 自带的 `passwall` 经常性的失效.无法分析出具体原因,遂清洁安装 `mihomo` 作为透明代理.

## 镜像

我的路由是 `FriendlyARM NanoPi R4S`, 使用 (https://openwrt.ai/) 在线编译镜像. 选择安装包时只选择了`UU加速器`和`WOL`.不得不说在线编译实在是比自己用虚拟机编译舒适太多了.

## 配置 Mihomo

首先提一下, [mihomo](https://github.com/MetaCubeX/mihomo) 就是之前的 `clash_meta`. 因为可能并不众所周知的原因转生了. 所以 mihomo 本身就是支持接受 Tproxy 流量作为入站的. 对于性能更有追求的人可以选择XTLS, 不过我实测没有感觉 mihomo 有什么明显的问题.

下载安装等过程不必多说, 值得提一句的是 mihomo 启动时会自动下载 geoip.dat. 对于网络环境不好的人来说可能会卡在这部.实操中我更建议提前下载好文件放到配置文件夹中, 可以加快启动速度. 另外的, 除非非常有必要我个人不推荐使用 `RULE-SET` 也就是规则集这个功能. 同样是因为存在下载失败的风险.