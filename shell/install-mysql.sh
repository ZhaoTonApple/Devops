#! /bin/bash

#======================================================================
#                        快速安装MySQL
#                     CentOS7 中已成功验证
#                      使用yum+rpm方式安装
#
#                      author: 朱正义
#======================================================================


# 首先配置阿里云yum镜像源
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

yum clean all

#更新缓存
yum makecache

# 下载mysql rpm
wget https://repo.mysql.com//mysql80-community-release-el7-3.noarch.rpm

# 安装rpm
rpm -Uvh mysql80-community-release-el7-3.noarch.rpm

# yum 安装mysql服务
yum install -y mysql-community-server

# 启动mysql服务
systemctl start mysqld.service

# 查看mysql服务状态
systemctl status mysqld.service

#以下添加创建用户创建组等等操作，因为服务器下载原因，以下的命令暂时省略了，有需要的这边可以在这个脚本下加上
