---
title: 一次关于r3f异常缩放的排查
description: 有时候前端就是这么魔幻
slug: 6c28e634
date: 2023-12-12 10:00:00+0800
image: cover.webp
categories:
  - tech
tags:
  - react
  - react-three-fiber
  - css
---

## 前情提要

在开发某个 3d 相关的微服务项目的时候,我使用了`@react-three/fiber`作为渲染引擎.在开发过程中,我发现了一个很奇怪的问题,就是在外层 dom 元素应用了 `CSS transform scale` 之后,`f3c`的渲染会再次应用一次缩放.

## 问题排查 & 解决

通过查看 `f3c` 文档可知,`f3c` 会在渲染的时候,将 `canvas` 的 `width` 和 `height` 设置为 `100%`,然后通过读取外部容器的大小来确定 `canvas` 的大小.这样做的目的是为了自适应外部容器的大小.

具体而言,`f3c` 使用了 `react-use-measure` 作为获取 dom 元素大小的库. 而问题则出在这里.

通过查看 `react-use-measure` 的源码可以发现.

```ts
// ...
const { left, top, width, height, bottom, right, x, y } =
  state.current.element.getBoundingClientRect() as unknown as RectReadOnly

const size = {
  left,
  top,
  width,
  height,
  bottom,
  right,
  x,
  y,
}

if (state.current.element instanceof HTMLElement && offsetSize) {
  size.height = state.current.element.offsetHeight
  size.width = state.current.element.offsetWidth
}
// ...
```

在默认行为当中, `react-use-measure` 会默认使用 `getBoundingClientRect` 来获取 dom 元素的大小.而 `getBoundingClientRect` 获取到的大小是**经过** `transform` 之后的大小.这就导致了 `f3c` 在渲染的时候,会再次应用一次缩放.

而解决这个问题也很简单,只需要传递一个 `offsetSize` 参数,就可以让 `react-use-measure` 使用 `offsetWidth` 和 `offsetHeight` 来获取 dom 元素的大小. `offsetWidth` 本身并不会受 `transform` 影响.

```tsx
<Canvas
  resize={{
    // 解决css csale 造成的canvas大小不一致问题
    offsetSize: true,
  }}
></Canvas>
```

## 碎碎念

天知道这个问题到底掉了我多少头发... 之前没有用过 `getBoundingClientRect`, 完全不知道还有这种坑. css 中绝大部分属性都是不响应 `transform` 的,但是 `getBoundingClientRect` 却是响应的.这个真的是太难了.

## 参考链接

- [react-use-measure](https://github.com/pmndrs/react-use-measure/blob/8639e5a93d60930159dc83743780ce4787fe90bb/src/web/index.ts#L81-L109)
- [MDN - Element.getBoundingClientRect()](https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect)
- [MDN - HTMLElement.offsetHeight](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/offsetHeight)
