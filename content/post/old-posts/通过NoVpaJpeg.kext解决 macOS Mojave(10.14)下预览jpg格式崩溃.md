---
title: '通过NoVpaJpeg.kext解决 macOS Mojave(10.14)下预览jpg格式崩溃'
date: 2018-11-26 19:02:17
tags: [技术笔记,黑苹果]
hideInList: false
feature: 
isTop: false
---

![56493506_p0.png](https://i.loli.net/2018/12/02/5c03976c6e5e0.png)

​	黑苹果升级到Mojave(10.14)后，遇到了通过预览打开jpg格式的图片时，预览会崩溃/卡转圈的情况，经过一番摸索，发现原因是预览调用了集显来解码JPG格式，而我因为有独显并没有打开集显。

​	除了通过修改为没有集显的机型SMBIOS 或者开启机器的集显，还有一种方法是在Clover中添加NoVPAJpeg.kext驱动来禁用集显解码。

​	原帖和Github放在了文章下方。

​	实测RX580工作正常。

更多……：

- [[HOW TO] Fix Quick Look and Preview issues in Mojave](https://www.insanelymac.com/forum/topic/334881-how-to-fix-quick-look-and-preview-issues-in-mojave/?page=8)
- [NoVPAJpeg](https://github.com/vulgo/NoVPAJpeg)
- 题图：id=56493506