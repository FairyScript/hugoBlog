---
title: 'API文档'
date: 2019-06-15 15:39:54
tags: [技术笔记,A岛]
feature: 
hidden: true
---

## 写在前面

这篇文章主要转载自<https://www.zybuluo.com/ovear/note/151481>， 但是API细节已经有所变动， 所以进行了修订， 添加了一些我自己的标注

### 一句话总结

- 因为API变动,返回值格式不一致， 建议所有的**数字**项全部强制类型转换

## 一些提示

以下所有的API都有两种方式可调用
[http://api?key=value&key2=value2](http://api/?key=value&key2=value2)
以及
<http://api/key/value/key2/value>

同时所有的API调用都应该有一个appid跟在最后
User-Agent必须为HavfunClient-平台

## 获取饼干

/Api/getCookie

返回

| key | value    | 说明                                                          |
| :-- | :------- | :------------------------------------------------------------ |
| 空  | ok/error | 若发放 cookie 成功， 则自动写入 cookie 并返回 ok， 否则 error |

> 主岛已经启用了新的饼干系统, 但备胎岛仍是可用的(?)

## 主系统信息

关于一些主系统的API

### 获取图片CDN地址

/Api/getCdnPath

返回

```json

```
### 获取备灾服务器地址

## 板块系统

关于岛主要功能的API

### 获取板块列表

/Api/getForumList

由于返回的是Json， 这里直接给实例

```json
[
    {
        "id": "4",
        "sort": "1",
        "name": "综合",
        "status": "n",
        "forums": [
            {
                "id": "4",
                "fgroup": "4",
                "sort": "1",
                "name": "综合版1",
                "showName": "",
                "msg": "msg",
                "interval": "15",
                "createdAt": "2011-10-21 15:49:28",
                "updateAt": "2015-06-23 17:26:28",
                "status": "n"
            },
            {
                "id": "20",
                "fgroup": "4",
                "sort": "2",
                "name": "欢乐恶搞",
                "showName": "",
                "msg": "msg",
                "interval": "15",
                "createdAt": "2011-10-21 15:48:43",
                "updateAt": "2014-11-05 00:27:52",
                "status": "n"
            },
            {
                "id": "11",
                "fgroup": "4",
                "sort": "3",
                "name": "推理",
                "showName": "",
                "msg": "•微小说、图片推理、解谜。<br/>•本版发文间隔为15秒。",
                "interval": "15",
                "createdAt": "2011-10-29 16:38:23",
                "updateAt": "2014-08-02 04:54:09",
                "status": "n"
            }
        ]
    }
]
```

这里针对返回值做一下解释
第一层JsonArray中的Object为分组， 具体信息如下

| key    | 说明                                                |
| :----- | :-------------------------------------------------- |
| forums | 这里是在本组的 forum                                |
| id     | 该板块组的 ID                                       |
| name   | 这个就不用说了吧*(:з」∠)*                           |
| sort   | 服务器的排序值， 越小优先级越高， 若为-1 则自动排序 |

forumObj信息

| key      | 说明                                               |
| :------- | :------------------------------------------------- |
| fgroup   | 所属组的 id                                        |
| id       | 额。 。 |
| interval | 该板块的发言间隔时间                               |
| name     | 版块名称                                           |
| showName | 板块显示的名字， 若该值不为空则显示该值(包含 html) |
| sort     | 跟上面一样                                         |
| status   | 始终为 n                                           |

### 获取板块串

/Api/showf
输入:

| key  | 说明          |
| :--- | :------------ |
| id   | 获取板块的 id |
| page | 分页          |

> 提示: 两个值都不能为空

返回:

```json
[
    {
        "id": "18507780",
        "img": "2019-06-14/5d0292f7e4697",
        "ext": ".png",
        "now": "2019-06-14(五)02:16:24",
        "userid": "1tnMQXQ",
        "name": "无名氏",
        "email": "",
        "title": "无标题",
        "content": "这建模不如做里番可惜了啊(つд⊂)",
        "sage": "0",
        "admin": "0",
        "remainReplys": 3,
        "replyCount": "8",
        "replys": [
            {
                "id": "18507804",
                "img": "",
                "ext": "",
                "now": "2019-06-14(五)02:21:52",
                "userid": "m7s6Xcm",
                "name": "无名氏",
                "email": "",
                "title": "无标题",
                "content": "拉良家妇女下水<br />\n劝失足姑娘上岸",
                "sage": "0",
                "admin": "0"
            }
        ]
    }
]
```

| key          | 说明                                               |
| :----------- | :------------------------------------------------- |
| admin        | 是否是酷炫红名， 如果是酷炫红名则 userid 为红名 id |
| content      | .... 这个你也懂                                    |
| email        | 你懂得                                             |
| ext          | 该串图片的后缀                                     |
| id           | 该串的 id                                          |
| img          | 该串的图片相对地址                                 |
| name         | 你懂得                                             |
| now          | 该串的可视化发言时间                               |
| remainReplys | 还剩余多少个回复(指没有在 showf 中返回)            |
| replyCount   | 总共有多少个回复                                   |
| replys       | 主页展示回复的帖子                                 |
| title        | 你还是懂的*(:з」∠)*                                |
| userid       | 该串的饼干                                         |

> 需要注意的是， "remainReplys"是新添加项目， 是**数字格式**， 而"replyCount"返回的是**字符串**格式

小提示

1. image的缩略图地址为 <http://cdnpath/thumb/ext>
2. image的真实地址为 <http://cdnpath/image/ext>
3. image的cdnpath自己上页面上扒(:з」∠)
4. replys对象的相关信息和上面相似。 。 你们也应该懂得。 。 累屎了
5. 噢， 要凑够六条才行→_→（强迫症）
6. 还有一条， 可以通过img是否为空来判断是否有图片

### 获取时间线

/Api/timeline

```json
[
    {
        "id": "18507780",
        "fid": "4",
        "img": "2019-06-14/5d0292f7e4697",
        "ext": ".png",
        "now": "2019-06-14(五)02:16:24",
        "userid": "1tnMQXQ",
        "name": "无名氏",
        "email": "",
        "title": "无标题",
        "content": "这建模不如做里番可惜了啊(つд⊂)",
        "sage": "0",
        "admin": "0",
        "remainReplys": 3,
        "replyCount": "8",
        "replys": [
            {
                "id": "18507804",
                "img": "",
                "ext": "",
                "now": "2019-06-14(五)02:21:52",
                "userid": "m7s6Xcm",
                "name": "无名氏",
                "email": "",
                "title": "无标题",
                "content": "拉良家妇女下水<br />\n劝失足姑娘上岸",
                "sage": "0",
                "admin": "0"
            }
        ]
    }
]
```

| key          | 说明                                               |
| :----------- | :------------------------------------------------- |
| admin        | 是否是酷炫红名， 如果是酷炫红名则 userid 为红名 id |
| content      | .... 这个你也懂                                    |
| email        | 你懂得                                             |
| ext          | 该串图片的后缀                                     |
| fid          | 该串所属的板块 id                                  |
| id           | 该串的 id                                          |
| img          | 该串的图片相对地址                                 |
| name         | 你懂得                                             |
| now          | 该串的可视化发言时间                               |
| remainReplys | 还剩余多少个回复(指没有在 showf 中返回)            |
| replyCount   | 总共有多少个回复                                   |
| replys       | 主页展示回复的帖子                                 |
| title        | 你还是懂的*(:з」∠)*                                |
| userid       | 该串的饼干                                         |

实际上和showf是差不多的啦…只不过多了一个"fid"用来标识时间线上串的所述板块

### 获取串内容

/Api/thread
输入:

| key  | 说明    |
| :--- | :------ |
| id   | 串的 id |
| page | 分页    |

提示: 同样两个都不能为空

返回:

```json
{
    "id": "6467841",
    "img": "",
    "ext": "",
    "now": "2015-08-12(三)16:08:00",
    "userid": "F0zz1FP",
    "name": "无名氏",
    "email": "",
    "title": "无标题",
    "content": "尼玛本来我如果说个好的,知道了.这个运维工作就到手了,我多了几句嘴,然后对方就我说的提了几个问题我半天答不上来,结果到手的offer飞了.尼玛,真够郁闷的(;´Д`)",
    "admin": "0",
    "replyCount": "7",
    "replys": [
        {
            "id": "6467854",
            "img": "",
            "ext": "",
            "now": "2015-08-12(三)16:13:05",
            "userid": "30ru124",
            "name": "无名氏",
            "email": "",
            "title": "无标题",
            "content": "嘴欠得肥宅",
            "admin": "0"
        }
    ]
}
```

关于Thread Obj

| key        | 说明                                               |
| :--------- | :------------------------------------------------- |
| admin      | 是否是酷炫红名， 如果是酷炫红名则 userid 为红名 id |
| content    | .... 这个你也懂                                    |
| email      | 你懂得                                             |
| ext        | 该串图片的后缀                                     |
| id         | 该串的 id                                          |
| img        | 该串的图片相对地址                                 |
| name       | 你懂得                                             |
| now        | 该串的可视化发言时间                               |
| replyCount | 总共有多少个回复                                   |
| replys     | 主页展示回复的帖子                                 |
| title      | 你还是懂的*(:з」∠)*                                |
| userid     | 该串的饼干                                         |

→_→ 我不会告诉你这是从上面复制过来的， 小提示也跟上面一样也

> 特殊的， ID为9999999的广告串， 返回的"id"和"admin"都是**数字**

### 获取回应串

/Api/ref

输入： 

| key | 说明    |
| :-- | :------ |
| id  | 串的 id |

返回： 

```json
{
    "id": "17901165",
    "img": "2019-05-05/5cce8c7195a50",
    "ext": ".jpg",
    "now": "2019-05-05(日)15:10:41",
    "userid": "topVtba",
    "name": "无名氏",
    "email": "",
    "title": "无标题",
    "content": "完 全 魔 幻 现 实 跑 团<br />\r\n<br />\r\n【日常】【超能】【魔幻现实】【青春恋爱】【搞笑】<br />\r\n<br />\r\n以上标签，和本团 【没 有 任 何 关 系】<br />\r\n<br />\r\n短暂（？）的短暂前情提要<br />\r\n<font color=\"#789922\">&gt;&gt;No.17498853</font><br />\r\n<br />\r\n总之你重生了",
    "sage": "0",
    "admin": "0"
}
```

emmm…真的需要我进一步说明吗？ 

#### 旧有API

/Home/Forum/ref

输入： 

| key | 说明    |
| :-- | :------ |
| id  | 串的 id |

返回： 

```html
<div class="h-threads-item">
    <div data-threads-id="17962944" class="h-threads-item-reply h-threads-item-ref">
        <div class="h-threads-item-reply-main">
            <div class="h-threads-info">
                <span class="h-threads-info-title">无标题</span>
                <span class="h-threads-info-email">无名氏</span>
                <span class="h-threads-info-createdat">2019-05-09(四)18:11:05</span>
                <span class="h-threads-info-uid">ID:DGDH18d</span>
                <span class="h-threads-info-report-btn">[
                    <a href="/f/值班室?r=17962944">举报</a>]
                </span>
                <a href="/t/17962944?r=17962944" class="h-threads-info-id">No.17962944</a>
                <span data-uk-dropdown="data-uk-dropdown" class="h-admin-tool uk-button-dropdown">
                    <a href="#" class="uk-button uk-button-link uk-button-small">管理</a>
                    <div class="uk-dropdown uk-dropdown-small">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li class="uk-nav-header">管理 -&gt; No.17962944</li>
                            <li>
                                <a href="/Home/Forum/sagePost/id/17962944.html">SAGE</a>
                            </li>
                            <li>
                                <a href="http://hacfun.tv:1336/content/threads/6187238/set?key=lock&amp;value=true">锁定</a>
                            </li>
                            <li class="uk-nav-divider"></li>
                            <li>
                                <a href="http://hacfun.tv:1336/content/threads/6187238/removeImages">删图</a>
                            </li>
                            <li>
                                <a href="/Home/Forum/delPost/id/17962944.html">删串</a>
                            </li>
                            <li class="uk-nav-divider"></li>
                            <li>
                                <a href="http://hacfun.tv:1336/content/threads/6187238/update">编辑</a>
                            </li>
                            <li>
                                <a href="http://hacfun.tv:1336/content/threads?parent=6187238">查询</a>
                            </li>
                            <li>
                                <a href="/Home/Forum/banip/id/17962944.html" class="qlink">锁IP</a>
                            <li>
                                <a href="/Home/Forum/banCookie/id/17962944.html" class="qlink">锁Cookie</a>
                        </ul>
                    </div>
                </span>
            </div>
            <div class="h-threads-content">
                朱军有什么丧丧的小情歌啊，最近迷上JOJI这个宝藏男孩了。 </div>
            <div class="uk-clearfix"></div>
        </div>
    </div>
</div>
```

嗯， 我知道， 混进来了一个画风不一样的……

都说了是旧有API嘛(摔)， 没有办法， 这个API可以通过"h-thread-info-id"的href属性来获取到回应的主串， 管理API的地址也给你看到啦(当然鉴权什么的……你懂的)

目前只有部分功能可以用， 至于是哪些嘛……自己猜

### 发表新串

/Home/Forum/doReplyThread.html

输入： 
**body**
| key | type | 说明 |
| :-- | :--- | :-- |
| resto(二选一) | number or string | 要回应的串号 |
| fid(二选一)| number or string | 要发串的版块号|
| name | string | 名称 |
| isManager | object | 是否用红名发言(只要有这项即判断为红名) |
| email |string | 邮箱 |
| title | string | 标题 |
| content | string| 正文 |
|water|boolen| 是否添加水印|
|image| binary| 图片文件|
|__hash__（可选）|string|饼干|



## 订阅系统

### 查询订阅

/Api/feed

输入:

| key  | 说明                                                                  |
| :--- | :-------------------------------------------------------------------- |
| page | 分页                                                                  |
| uuid | 这个为手机的 uuid， 或者自定义的一些识别用户的方法， 用来识别某个用户 |

返回:

```json
[
    {
        "id": "6460798",
        "fid": "4",
        "category": "",
        "img": "",
        "ext": "",
        "now": "2015-08-10(一)02:04:49",
        "userid": "crGIPK87",
        "name": "无名氏",
        "email": "",
        "title": "无标题",
        "content": "我现在身边睡着一个全裸的伪娘。。。我的心情很复杂<br>",
        "status": "n",
        "admin": "0"
    }
]
```

具体信息参阅前面的啦~好累啊*(:з」∠)*懒死了

### 增加订阅

/Api/addFeed
输入

| key  | 说明                                                                  |
| :--- | :-------------------------------------------------------------------- |
| tid  | 需要订阅的串 id                                                       |
| uuid | 这个为手机的 uuid， 或者自定义的一些识别用户的方法， 用来识别某个用户 |

返回

| key    | 说明                                                              |
| :----- | :---------------------------------------------------------------- |
| 并没有 | 如果成功返回 "订阅大成功 →_→" 出错或者其他原因返回 "该主题不存在" |

### 删除订阅

/Api/delFeed
提交:

| key  | 说明                                                                  |
| :--- | :-------------------------------------------------------------------- |
| tid  | 需要订阅的串 id                                                       |
| uuid | 这个为手机的 uuid， 或者自定义的一些识别用户的方法， 用来识别某个用户 |

返回:

| key    | 说明                                                  |
| :----- | :---------------------------------------------------- |
| 并没有 | 如果成功返回 "取消订阅成功!" 出错或者其他原因返回原因 |
