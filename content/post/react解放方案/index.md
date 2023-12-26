---
title: '我中意的React解决方案'
date: 2022-02-21 16:33:51
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

### [Mobx](https://mobx.js.org/)

目前用的最多的解决方案，对FC的支持也不错。问题在于必须使用observer包裹组件，而且兼容性不强

### [Immer](https://immerjs.github.io/immer/)

Mobx作者新搞的小玩具，实用性一般，因为要修改必须从顶级state的draft开始访问，否则不能正确响应。但是思路还是很好的，工程量不大的小项目小组件可以试试看

### [Valtio](https://github.com/pmndrs/valtio)

最近发现的新玩具，似乎是最符合我信息的解决方案了，还没有试过但是很感兴趣，用过之后遇到问题会再写后续文章

## 路由

### react-router

不用多说，官方推荐。不是非常易用但是足够好用，也懒得折腾更多了，之前有段时间（大概是5.0左右？）对hooks的支持很差所以尝试了其他的解决方案，现在支持还不错就换回来了。

### [React Hook Router](https://github.com/Paratron/hookrouter)

这就是当初用过的方案，现在不再推荐了因为 react-router 已经很好了，而且这个作者不喜欢TS所以这方面的支持也不太好，而且很久没更新了。但作为一个小型router的实现代码是值得学习的。

## CSS

### emotionJS

目前在用的，除了 `css props` 我颇有微词以外，其他的部分都算完美，`css-in-js`保证了样式的可控性（我知道大部分时候用不到，但是用得到的时候还是很爽的），使用完整的CSS/SCSS语法而不是什么`Tailwind`黑科技。库很小而且泛用性很高。本质上这东西和`styled`是一家子所以代码也很容易迁移。平台支持广：虽然理论上这东西支持RN但属实没必要。

### styled-jsx

呃，这东西就比较微妙了。首先他是需要babel支持的，这意味着在某些你不想用，或者不能用babel的场合这东西就跪了。与emotion相比实际上我更喜欢styled的写法，即把style单独写在一个标签里面然后用`scoped css`限制他的作用域，但是styled-jsx是不建议注入子组件的样式的，我不赞同这个设计。所以权衡之后放弃了这东西。btw `next.js` 默认用的这个。说明还是有相当一部分人喜欢 `shadow-css` 设计的。看个人喜好和具体业务场景了。

### @material-ui/style

这东西入土了，新的mui用的是emotion，然后保留了之前的api而已。

### react-spring

这东西我本来想单独分个动效来说的，但是讲道理好像和CSS重叠的部分还是很广的，也就一并讲了。

很好用，虽然新的api有点反直觉但是能get到他们的设计思路所以我保留意见。实际上这个弹性库并不一定是用来给css的，你可以给任何你想加上可控曲线效果的地方用上。同样支持RN，但没研究过。

## Canvas

### Konva

比较复杂，这东西其实是新建了一个react实例然后挂载在你的组件树上，所以会有一些奇妙的小问题。但总的来说还是足够好用。暂时找不到比它更方便的canvas库了，或者说更进一步的需求建议用flutter。

先写这么多，想起来什么再补充。

---

题图 [https://twitter.com/kirizieeel/status/1495523468657397762](https://twitter.com/kirizieeel/status/1495523468657397762)