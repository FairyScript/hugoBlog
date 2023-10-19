---
title: 'Nginx从入门到入土#1——配置文件初探'
date: 2018-04-13 19:06:22
tags: [技术笔记,Nginx]
published: true
hideInList: false
feature: 
isTop: false
---

本文意在简要说明Nginx配置文件以尽快上手，诸多进阶配置项不在本文的介绍范围内，请自行Google :)

### Nginx 文件树

Nginx的配置文件主要分为两类——Nginx自身的配置（即/etc/nginx/nginx.conf）和vHost配置文件（/etc/nginx/sites-available内文件）

![](https://i.loli.net/2018/04/13/5ad0932aba39d.png)
（图为/etc/nginx文件夹一览）

<!-- more -->

关于Nginx.conf文件，一般情况下不需要调整就可以正常工作，所以本文暂不展开讲解。但是值得注意的是，决定使用哪个vHost配置文件的相关内容位于Nginx.conf文件内：

```
./nginx.conf
##
# Virtual Host Configs
##

include /etc/nginx/conf.d/*.conf;
include /etc/nginx/sites-enabled/*;
```

可以通过更改include字段来选择启用的vHost配置文件

### vHost配置

由上例可知，实际中Nginx使用的是./sites-enabled/下的配置文件，然而一般情况下，我们选择将配置文件放到./sites-available/文件夹下，然后将要应用的配置文件软链接到sites-enabled文件夹下来使用。

如果你是通过apt或yum安装的Nginx，./sites-available/文件夹下应该会有一个default配置（也有可能同时存在它的备份），这就是nginx的默认配置文件。如果只是简单的端口转发/同时运行多个站点，只要在default的基础上进行修改即可。

以下是一个default文件的例子：

```
server {
	listen 80;
	server_name localhost;
	root /var/www;
	index index.html index.htm;
	access_log  /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;
	location / {
		return 301 https://$host$request_uri;
	}
}
```
其中：
* server{}代表了一个服务端，理论上每个不同的服务对应着一个server；
* listen指你要监听的端口；
* server_name 指响应的域名
    * 详见 https://www.jianshu.com/p/2d6f16a32b37
* root 指网站的根目录
* index指你网站的起始页面
* location{}是该服务所响应的路径（即你的域名/IP后面的部分）

下面我们详细说明一下location 
```
location /blog {
    stub_status on;
    access_log off;
    root /var/www;
    index index.html;
    }
```
location后面跟的“/”就是其响应的路径，其中“/”指的是响应所有路径。即形如“yourdomain.name/\*\*\* ”的URL都会被响应。如果location后面跟的是“/blog”，那么形如 “ yourdomain.name/blog ”的URL就会被响应。

是的，同一个server可以有多个location。
同时在location内，server中的一些数据可以被覆盖，比如 root。



---
修改日志：

2018-04-16：稍作修改；

2018-04-13：初版；

\#EOF

