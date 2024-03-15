##### centos
```
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
```



##### Ubuntu
```
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh
```
##### Debin
```
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh
```




##### 使用
安装成功后，控制台会打印面板访问信息，可通过浏览器访问 1Panel：

```
http://目标服务器 IP 地址:目标端口/安全入口
```
![img_13.png](img_13.png)
- **如果使用的是云服务器，请至安全组开放目标端口。**
- **ssh 登录 1Panel 服务器后，执行 1pctl user-info 命令可获取安全入口（entrance）**
# 命令行工具
## 1 1pctl[**¶**](https://1panel.cn/docs/installation/cli/#1-1pctl)
1Panel 默认内置了命令行运维工具 **1pctl**，通过执行 1pctl help，可以查看相关的命令说明。

```
Usage:
  1pctl [COMMAND] [ARGS...]
  1pctl --help

Commands: 
  status              查看 1Panel 服务运行状态
  start               启动 1Panel 服务
  stop                停止 1Panel 服务
  restart             重启 1Panel 服务
  uninstall           卸载 1Panel 服务
  user-info           获取 1Panel 用户信息
  listen-ip           切换 1Panel 监听 IP
  version             查看 1Panel 版本信息
  update              修改 1Panel 系统信息
  reset               重置 1Panel 系统信息
  restore             恢复 1Panel 服务及数据
```
## 2 1pctl reset[**¶**](https://1panel.cn/docs/installation/cli/#2-1pctl-reset)
**重置 1Panel 系统信息，包括取消安全入口登录，取消两步验证等**

```
Usage:
  1pctl reset [COMMAND] [ARGS...]
  1pctl reset --help

Commands: 
  domain              取消 1Panel 访问域名绑定
  entrance            取消 1Panel 安全入口
  https               取消 1Panel https 方式登录
  ips                 取消 1Panel 授权 IP 限制
  mfa                 取消 1Panel 两步验证
```
## 3 1pctl listen-ip[**¶**](https://1panel.cn/docs/installation/cli/#3-1pctl-listen-ip)
**修改 1Panel 监听 IP**

```
Usage:
  1pctl listen-ip [COMMAND] [ARGS...]
  1pctl listen-ip --help

Commands: 
  ipv4                监听 IPv4
  ipv6                监听 IPv6
```
## 4 1pctl update[**¶**](https://1panel.cn/docs/installation/cli/#4-1pctl-update)
**修改 1Panel 系统信息**

```
Usage:
  1pctl update [COMMAND] [ARGS...]
  1pctl update --help

Commands: 
  username            修改面板用户
  password            修改面板密码
  port                修改面板端口
```
## 5 1panel app[**¶**](https://1panel.cn/docs/installation/cli/#5-1panel-app)
**应用商店相关命令，包括初始化应用等**

```
Usage:
  1panel app [COMMAND] [ARGS...]
  1panel app --help

Commands: 
  init                初始化应用
```
创建应用名为 app_name，版本为 v1.0.0 的应用，命令如下：
1panel app init -k app_name -v v1.0.0
