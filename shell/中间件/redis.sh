#!/bin/bash

systemctl stop firewalld
systemctl disable firewalld
setenforce 0

yum -y install gcc gcc-c++ make

cd /opt
if [ ! -f " redis-5.0.7.tar.gz" ]; then
wget http://download.redis.io/releases/redis-5.0.7.tar.gz
fi

tar zxvf redis-5.0.7.tar.gz -C /opt/
cd redis-5.0.7/
make
make PREFIX=/usr/local/redis install

yum -y install tcl expect
cd /opt/redis-5.0.7/utils/
/usr/bin/expect <<EOF
spawn ./install_server.sh
expect "instance" {send "\r"}
expect "config" {send "\r"}
expect "log" {send "\r"}
expect "data" {send "\r"}
expect "executable" {send "/usr/local/redis/bin/redis-server\r"}
expect "abort" {send "\r"}
expect eof
EOF

ln -s /usr/local/redis/bin/* /usr/local/bin/

sed -i '/bind 127.0.0.1/c bind 0.0.0.0' /etc/redis/6379.conf
sed -i 's/appendonly no/appendonly yes/' /etc/redis/6379.conf

/etc/init.d/redis_6379 restart
/etc/init.d/redis_6379 status

netstat -natp | grep "redis"

pgrep "redis" &> /dev/null
if [ $? -eq 0 ];then
        echo -e "\033[46;37m Redis 服务运行正常 \033[0m"
else
        echo -e "\033[46;37m Redis 服务运行异常，请检查 \033[0m"
fi
sleep 2
echo ' '
echo -e "\033[46;37m Redis 未设置密码，执行 redis-cli 命令登录 \033[0m"
