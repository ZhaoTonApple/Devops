#! /bin/bash


#======================================================================
#			 快速安装redis shell脚本
#
# 			  author: 朱正义
#======================================================================

hasRedis(){
    RESULT=$(redis-server -v)
    echo "${RESULT}"
    if [[ ! $RESULT ]]
    then
        return 0;
    fi
    return 1;
}

hasRedis

if [ $? != 1 ]
then
    echo "Not Found redis"
    echo "Installing redis..."
    yum install -y redis
    hasRedis
    if [ $? != 1 ]
    then
      echo "Install Redis Fail"
    fi
fi

# 设置redis开机启动
systemctl enable redis
# 在后台启动redis服务
systemctl start redis
# 通过redis-cli是否能正常连接，输出PONG，则连接成功
redis-cli ping

echo ""
