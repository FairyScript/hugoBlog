---
title: '我中意的React解决方案'
date: 2022-02-21 16:33:51
lastmod: 2023-12-26 18:20:51
tags: []
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

### [Mobx](https://mobx.js.org/)

备用方案,和 valtio 差不太多。问题在于必须使用 observer 包裹组件，而且兼容性不强

### [Immer](https://immerjs.github.io/immer/)

Mobx 作者新搞的小玩具，实用性一般，因为要修改必须从顶级 state 的 draft 开始访问，否则不能正确响应。但是思路还是很好的，工程量不大的小项目小组件可以试试看

## 路由

### react-router

不用多说，官方推荐。不是非常易用但是足够好用，也懒得折腾更多了，之前有段时间（大概是 5.0 左右？）对 hooks 的支持很差所以尝试了其他的解决方案，现在支持还不错就换回来了。

### [React Hook Router](https://github.com/Paratron/hookrouter)

这就是当初用过的方案，现在不再推荐了因为 react-router 已经很好了，而且这个作者不喜欢 TS 所以这方面的支持也不太好，而且很久没更新了。但作为一个小型 router 的实现代码是值得学习的。

## CSS

### emotionJS

目前在用的，除了 `css props` 我颇有微词以外，其他的部分都算完美，`css-in-js`保证了样式的可控性（我知道大部分时候用不到，但是用得到的时候还是很爽的），使用完整的 CSS/SCSS 语法而不是什么`Tailwind`黑科技。库很小而且泛用性很高。本质上这东西和`styled`是一家子所以代码也很容易迁移。平台支持广：虽然理论上这东西支持 RN 但属实没必要。

### styled-jsx

呃，这东西就比较微妙了。首先他是需要 babel 支持的，这意味着在某些你不想用，或者不能用 babel 的场合这东西就跪了。与 emotion 相比实际上我更喜欢 styled 的写法，即把 style 单独写在一个标签里面然后用`scoped css`限制他的作用域，但是 styled-jsx 是不建议注入子组件的样式的，我不赞同这个设计。所以权衡之后放弃了这东西。btw `next.js` 默认用的这个。说明还是有相当一部分人喜欢 `shadow-css` 设计的。看个人喜好和具体业务场景了。

### @material-ui/style

这东西入土了，新的 mui 用的是 emotion，然后保留了之前的 api 而已。

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
