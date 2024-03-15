#!/bin/bash
# 安装JDK
sudo yum install -y java-1.8.0-openjdk
# 配置Java环境变量
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk" >> ~/.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
source ~/.bashrc
# 安装Maven
sudo yum install -y maven
# 安装Git
sudo yum install -y git
# 安装MySQL
sudo yum install -y mysql-server
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo mysql_secure_installation
# 安装Redis
sudo yum install -y redis
sudo systemctl start redis
sudo systemctl enable redis
