#!/bin/bash

# 更新系统
echo "Updating system..."
yum -y update && yum -y install epel-release

# 放开防火墙端口
echo "Opening firewall ports..."
firewall-cmd --zone=public --add-service=mysql --permanent
firewall-cmd --zone=public --add-service=redis --permanent
firewall-cmd --reload

# 安装JDK
echo "Installing JDK..."
JDK_VERSION=8u361  # 替换为你需要的版本号
JDK_ARCHIVE=jdk-${JDK_VERSION}-linux-x64.tar.gz
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" https://download.oracle.com/java/${JDK_ARCHIVE}
mkdir -p /usr/local/java
tar -zxf ${JDK_ARCHIVE} -C /usr/local/java
JAVA_HOME=/usr/local/java/jdk${JDK_VERSION}
export JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile.d/java.sh
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile.d/java.sh
source /etc/profile.d/java.sh

# 安装Maven
echo "Installing Maven..."
MAVEN_VERSION=3.8.5  # 替换为你要安装的Maven版本
MAVEN_ARCHIVE=apache-maven-${MAVEN_VERSION}-bin.tar.gz
wget https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/${MAVEN_ARCHIVE}
mkdir -p /usr/local/apache-maven
tar -zxf ${MAVEN_ARCHIVE} -C /usr/local/apache-maven
mvn_home=/usr/local/apache-maven/apache-maven-${MAVEN_VERSION}
export MAVEN_HOME=$mvn_home
export PATH=$MAVEN_HOME/bin:$PATH
echo "export MAVEN_HOME=${MAVEN_HOME}" >> /etc/profile.d/maven.sh
echo "export PATH=\$MAVEN_HOME/bin:\$PATH" >> /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# 安装Git
echo "Installing Git..."
yum -y install git

# 安装MySQL
echo "Installing MySQL Server..."
yum -y install mysql-server
systemctl start mysqld

# 创建MySQL root用户
echo "Creating MySQL root user..."
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

# 安全配置MySQL
mysql_secure_installation  # 运行此命令进行MySQL安全配置

# 安装Redis
echo "Installing Redis..."
yum -y install redis
systemctl enable redis
systemctl start redis

echo "Installation of JDK, Maven, Git, MySQL and Redis is completed."

# 可选：进一步配置如数据库初始化等
