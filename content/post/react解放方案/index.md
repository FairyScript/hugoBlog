---
title: '我中意的React解决方案'
date: 2022-02-21 16:33:51
lastmod: 2024-02-20 16:37:51
tags:
  - 技术笔记
  - react
published: true
hideInList: false
feature: https://s6.jpg.cm/2022/02/21/LflaxW.md.jpg
isTop: false
---

![LflaxW.md.jpg](https://s6.jpg.cm/2022/02/21/LflaxW.md.jpg)

一些在我调查和实际生产中比较喜欢的解决方案

<!-- more -->

## 状态管理

### [Valtio](https://github.com/pmndrs/valtio)

目前用的最多的解决方案. 用起来有些坑(主要是 `this` 相关的部分)但整体来说很好.

### [Helux](https://github.com/heluxjs/helux)

目前正在进行测试的方案. 优势在于属于 `AIO` 方案, 所以对于各种奇奇怪怪的用例都有支持. 是否喜欢这种大而全的解决方案就见仁见智了.

### [Mobx](https://mobx.js.org/)

备用方案,和 valtio 差不太多。问题在于必须使用 observer 包裹组件，而且兼容性不强

## 路由

### react-router

不用多说，官方推荐。不是非常易用但是足够好用，也懒得折腾更多了，之前有段时间（大概是 5.0 左右？）对 hooks 的支持很差所以尝试了其他的解决方案，现在支持还不错就换回来了。

### [React Hook Router](https://github.com/Paratron/hookrouter)

这就是当初用过的方案，现在**不再推荐了**因为 `react-router` 已经很好了，而且这个作者不喜欢 TS 所以这方面的支持也不太好，而且很久没更新了。但作为一个小型 router 的实现代码是值得学习的。

## CSS

### emotionJS

目前在用的，除了 `css props` 我颇有微词以外，其他的部分都算完美，`css-in-js`保证了样式的可控性（我知道大部分时候用不到，但是用得到的时候还是很爽的），使用完整的 CSS/SCSS 语法而不是什么`Tailwind`黑科技。库很小而且泛用性很高。本质上这东西和`styled`是一家子所以代码也很容易迁移。平台支持广：虽然理论上这东西支持 RN 但属实没必要。

### react-spring

这东西我本来想单独分个动效来说的，但是讲道理好像和 CSS 重叠的部分还是很广的，也就一并讲了。

很好用，虽然新的 api 有点反直觉但是能 get 到他们的设计思路所以我保留意见。实际上这个弹性库并不一定是用来给 css 的，你可以给任何你想加上可控曲线效果的地方用上。同样支持 RN，但没研究过。

## 2D

### Pixi

新发现的玩具, 不同的地方在于使用了 `WebGL` 渲染所以性能非常的彳亍. 还没怎么用过回头再研究一下

### Konva

比较复杂，这东西其实是新建了一个 react 实例然后挂载在你的组件树上，所以会有一些奇妙的小问题。但总的来说还是足够好用。暂时找不到比它更方便的 canvas 库了，或者说更进一步的需求建议用 flutter。

先写这么多，想起来什么再补充。

---

题图 [https://twitter.com/kirizieeel/status/1495523468657397762](https://twitter.com/kirizieeel/status/1495523468657397762)
