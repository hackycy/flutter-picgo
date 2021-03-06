<div align="center">
  <img src="https://raw.githubusercontent.com/hackycy/flutter-picgo/master/docs/design/squareLogo144.png" alt="">
  <h1>Flutter-PicGo</h1>
  <blockquote>图片上传+管理新体验 </blockquote>
  <img src="https://img.shields.io/github/license/hackycy/flutter-picgo" alt="">
  <img src="https://img.shields.io/github/workflow/status/hackycy/flutter-picgo/Build and Release apk" alt="">
  <img src="https://img.shields.io/github/issues-closed/hackycy/flutter-picgo" alt="">
  <img src="https://img.shields.io/github/v/release/hackycy/flutter-picgo?include_prereleases" alt="">
  <img src="https://img.shields.io/github/downloads/hackycy/flutter-picgo/total" alt="">
</div>

# 应用概述

Flutter-PicGo: 一个用于快速上传图片并获取图片URL链接的**手机版**工具

**Flutter-PicGo 本体支持如下图床：**

- GitHub [v1.0+]
- SM.MS [v1.1+]
- Gitee [v1.2+]
- 七牛云 [v1.3+]
- 阿里云OSS [v1.4+]
- 腾讯云COS [v1.5+]
- ~~牛图网（已无法使用）~~ [v1.6+]
- 兰空 [v1.7+]
- 又拍云 [v1.8+]

> 开发进度可以查看 [Projects](https://github.com/PicGo/flutter-picgo/projects)，会同步更新开发进度

# 特色功能

- 长按相册列表项可**同步删除远端的文件**，也可配置仅删除本地列表
- 支持**管理（查看或删除）远端图床**（目前支持管理Github、Gitee、SM.MS、兰空、七牛）[v1.9+]
- 支持扫描二维码将[PicGo(v2.3.0-beta.2以上版本支持将配置导出成二维码)](https://github.com/Molunerfinn/PicGo/releases/tag/v2.3.0-beta.2)配置文件转换成**Flutter-PicGo**的配置
- 适配深色模式，可跟随系统或手动设置
- 支持将*Flutter-PicGo*的配置导出至剪切板

> 注：牛图与兰空不支持远端删除，腾讯云COS仅支持v5版配置

# 应用截图

![上传页面](https://github.static.si-yee.com/picgo/5E62E0A4-5A93-4C57-B090-E09F4100B755_L0_001_origin.IMG_8818.JPG)

<img src="https://github.static.si-yee.com/picgo/repo_use.gif" width="300px" />

# 下载安装

|        |                           Android                            |                             iOS                              |
| :----: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| 二维码 |   ![](https://github.static.si-yee.com/picgo/android.png)    |   ![](https://github.static.si-yee.com/picgo/appstore.png)   |
|  链接  | [Release](https://github.com/hackycy/flutter-picgo/releases) / [蒲公英](https://www.pgyer.com/flutter-picgo) | [AppStore](https://apps.apple.com/cn/app/flutter-picgo/id1519714305) |

> 感谢[Trevor-Lan](https://github.com/Trevor-Lan)提供的苹果开发者账户

# 应用说明

目前仅支持iOS与Android端，由于部分插件例如[sqflite](https://pub.dev/packages/sqflite)不支持Web端，所以应用也并不支持Web端。

# F & Q

## 简单使用说明

**上传前需要先去`设置` -> `图床设置`下设置图床的配置信息并设置默认上传图床，以及给予App所申请的权限（相册），否则无法进行上传。**

## 已不可用图床

- 牛图网（官网也无法使用）

## 关于Github图片上传问题

由于国内访问Github访问速度慢的原因，API访问也会经常出错，建议切换别的图床进行使用。

或者配置host提升访问速度，这里提供一种方式：

<img src="https://raw.githubusercontent.com/hackycy/flutter-picgo/dev/docs/hostconfig.jpeg" width="200px" />

在路由器（图中为小米的路由器）里面配置hosts，具体配置可以查看[Github520](https://github.com/521xueweihan/GitHub520)。

路由器配置hosts后连接Wi-Fi可以显著提升API的访问能力。

## 将配置信息转二维码供App扫码

这里拿Github举例：

GitHub的配置JSON（与桌面版Picgo配置信息一致）如下

``` json
{
	"github": {
		"branch": "",
		"customUrl": "",
		"path": "",
		"repo": "",
		"token": ""
	}
}
```

想要获取其它的配置信息可以在App随便填一下然后再导出配置，复制粘贴出来填写好配置信息，将这整段json去转换成二维码保存，例如[草料](https://cli.im)。在App扫码就能直接转换好配置了，不用再一项一项的填写。

> 已经使用过桌面版[PicGo](https://github.com/Molunerfinn/PicGo)则更加方便，直接使用桌面版导出二维码即可。
>
> 暂不支持备份图床已上传的图片。

# 有问题或者有更好的建议

- 欢迎提 [Issues](https://github.com/PicGo/flutter-picgo/issues)

> 如果项目有帮助到你或者喜欢这个项目，可以给个Star支持一下鸭

# 相关

- [PicGo](https://github.com/Molunerfinn/PicGo)：PicGo 的桌面版
- [vs-picgo](https://github.com/PicGo/vs-picgo)：PicGo 的 VS Code 版。
- [sf-nest-admin](https://github.com/hackycy/sf-nest-admin)：基于NestJs编写的带七牛文件管理的后台权限系统

# 致谢

- [Flutter-Go](https://github.com/alibaba/flutter-go)

# License

``` txt
MIT License

Copyright (c) 2020 Mr.Yang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

