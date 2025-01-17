---
title: '在hexo页面插入网易云播放器'
date: 2018-08-23 08:49:33
tags: [技术笔记,网易云音乐,Hexo]
hideInList: false
feature: https://s6.jpg.cm/2022/02/16/LBqbmt.png
isTop: false
---

![LBqbmt.png](https://s6.jpg.cm/2022/02/16/LBqbmt.png)

<!-- more -->

最近终于在百(shou)忙(lie)之余想起来还有个博客的事，最近几个月除了把博客搬迁到了gitpage就完全没有理睬这玩意，既然今天想起来了就干脆把之前魔改留下的坑稍微填一下……

为什么会有这篇文章呢，为了让博客看着稍微正常点，我找了关于如何在Md页面中插入HTML的教程，最后发现是原生支持的……那么问题就变成了要在页面上插入些什么东西才好，思前想后果然还是王道征途，音乐控件吧

那么就是惯例的Google，找到了如下的代码：

```html
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width="320" height="330" src="https://music.163.com/outchain/player?type=0&amp;id=24972133&amp;auto=0&amp;height=430"></iframe>
```
将这行代码直接放在需要的地方就可以实现如下效果的播放器：

<!-- more -->

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width="320" height="330" src="https://music.163.com/outchain/player?type=0&amp;id=24972133&amp;auto=0&amp;height=430"></iframe>





\<iframe>控件的参数可以从[这里](http://www.w3school.com.cn/tags/tag_iframe.asp)看到，可以借助参数来调整控件的外观。不过最重要的还是src部分的参数，将sec部分的‘type’和‘id’部分替换成自己的就可以了
其中：

* type为0的时候对应的是歌单的id；
* type为1的时候对应的是专辑的id；
* type为2的时候对应的是单曲的id

网易云自带的外链设置：`https://music.163.com/#/outchain/_type/_id/m/use/html`,将_type和_id改为需要的参数即可。

**2018.9.4更新**



最近将博客迁移到gitpages后发现此前的播放器不能正常显示，Google后发现是gitpage强制开启了https，而我之前的播放器src用了http……修改后解决

[参考链接](http://saili.science/2017/05/30/music/)

-------

题图：Pixiv_PID:70217074

\#EOF