---
title: '黑苹果fix USB端口（适用于10.14.1)'
date: 2018-11-17 21:39:54
tags: [技术笔记,黑苹果]
published: false
---

> 本文所述内容来源于 https://www.insanelymac.com/forum/topic/335018-intel-fb-patcher-v165/ 

自macOS版本来到10.14.1之后，过去常用的通过USBInjectall.kext 来破解系统USB端口数来完成后续修补的办法已经部分失效，本文即是为了在新版本系统中修补USB端口而作，其中核心内容译自开头链接

所需工具：

- macOS（如果有低于10.14.1的系统，可以直接进行修补而不需要重复下面的步骤）
- FB-Patcher （https://www.insanelymac.com/forum/topic/335018-intel-fb-patcher-v165/）
- USBInjectall.kext （https://github.com/RehabMan/OS-X-USB-Inject-All）
- Clover （文本编辑或者Clover Configurator）
- 一个可以使用的USB3.0设备



### ===2019.4.5更新===



### 步骤1

在Clover（/Clover/kexts/Other）中添加USBInjectall.kext，为了使其工作，在Clover-Acpi-DSDT中添加三个patch：

 - Rename XHC1 -> XHC
 - Rename EHC1 -> EH01
 - Rename EHC2 -> EH02

![](https://i.loli.net/2018/12/06/5c0830114dc9d.png)

<!-- more -->

### 步骤2

在Clover-boot-customflag中添加`-uia_exclude_ss`（屏蔽USB3.0控制器），重启电脑。

![](https://i.loli.net/2018/12/06/5c083081e85b2.png)

此时你的电脑应该只有USB2.0控制器在工作。

### 步骤3



启动FB-Patcher，选择General-USB。

![](https://i.loli.net/2018/12/02/5c039f9f5c729.png)

列表中绿色的项即是可以（正在）使用的USB2.0端口。此时你需要把电脑上**每一个**USB接口都插一遍。最后显示的部分就是你得电脑上所有可用的USB2.0端口。请**特别留意**你电脑的**键盘/鼠标**所对应的hs端口编号（比如我的是`HS07`与`HS08`，稍后会用到。将所有没有使用的端口选中，点击左下方的删除，然后导出成USBports.kext保存，USB2.0部分完成。

### 步骤4

再次打开Clover，编辑bootflag将`-uia_exclude_ss`替换为`-uia_exclude_hs`;添加`uia_include=<font color="blue">x</font>`。此处的x为刚刚获取的键盘鼠标端口（意为排除对键盘鼠标端口的屏蔽），重启电脑。重复步骤3，记录下所有可工作的SS端口

注：一个USB3.0物理接口同时对应着USB2.0和USB3.0两个port，如果一个USB3.0接口只开启了SS port的话，它将不能识别USB2.0的设备，而USB2.0物理接口只对应一个hs port。



USB Connector 属性：

- 0 为USB2.0 (480Mbps)；
- 3 为USB3.0 (5.0Gbps)；
- 255 为内建接口