---
title: '记一次CSS样式异常排查'
description:
date: 2024-06-20T16:50:00+08:00
slug: 1b7980ef
image: cover.webp
math:
license:
hidden: false
comments: true
categories:
  - tech
tags:
  - react
  - css
  - vite
draft: false
---

最近在工作中遇到了一起 CSS style 样式无法生效的问题.特此记录.

### 一些信息

项目中涉及的技术栈如下

- React 18
- Vite 5

根据目前分析的结果,可以认为任何直接注入 CSS 样式的库都会收到影响(包括 emotionJS), 不确定类似 Post CSS 之类的编译器会不会遇到该问题.但感觉上是可能的.

## 表现

```jsx
import image from 'some.svg'

const Foo = () => <div style={{ maskImage: `url(${image})` }} />
```

该代码在编译后产物内可以看到样式存在,但 Chrome 渲染之后,在 dom 内无法看到该条样式,若同时存在其他样式共存则其他样式不受影响.

## 原因

原因是因为 Vite 默认所采取的 [`inline import` 优化功能](https://vitejs.dev/config/build-options.html#build-assetsinlinelimit) 会默认将小于 4kb 的文件以 `data URL` 形式内联进代码. 这在大部分情况下都是正常工作的,但在本用例下:

- svg 小于 4kb, 满足内联条件
- svg 本身是纯文本内容. dataURL 不会以 base64 形式而是直接以明文形式插入
- css 样式本质上是 字符串拼接,且 js 内使用不会触发 vite 关于 CSS url() 的优化

所以会生成形如

```jsx
{
  maskImage: 'url(data:image/svg+xml;utf8,<svg>...</svg>)'
}
```

的内容.该内容语法错误股会被浏览器忽略.

## 解决方案:

### 1. 在 URL 外加上双引号 <">

```jsx
style={{ maskImage: `url("${image}")` }}
```

### 2. 在 Vite 中设置,不内联 svg

```ts
// vite.config.ts
assetsInlineLimit(filePath, content) {
  //svg永远不内联
  if (filePath.endsWith('.svg')) {
    return false
  }
  // 小于 4kb 的文件转为 base64
  return content.length < 4 * 1024
},

```

#EOF
