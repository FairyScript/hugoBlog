---
title: "gdal地图重投影的离奇bug"
description: 
date: 2024-09-07T10:16:47+08:00
slug: 3d6d3035
image: cover.webp
math: 
license: 
hidden: false
comments: true
categories:
  - tech
tags:
  - gis
  - gdal
draft: false
---

`gdal` 重新投影的时候,注意不要包含极点坐标,会有神奇的bug

建议使用 `gdal_translate` 提前切除极点坐标.

`gdal_translate -projwin 90 60 160 0 -of GTiff input.tif ouput.tif`

## 推荐阅读

https://github.com/syncpoint/terrain-rgb