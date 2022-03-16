#!/bin/bash
if [ ! -n "$1" ];then
  echo "请输入文件夹名称！"
  exit 0
fi

if [ ! -d "../$1"];then
  echo "备份文件夹$1不存在！"
  exit 0
fi

fileName=''

if [ ! -n "$2" ];then
  echo "未输入回滚文件名，使用最新的备份"
  cd `../$1`
  fileName=`ls -lt |grep .jar |head -1 |awk '{print $9}'`
  cd ..
else
  fileName=`$2`
fi

if [ ! -f "../$1/$fileName" ];then
  echo "备份文件/$1/$fileName不存在！"
  exit 0
fi
sh stop.sh
cd ..
cp `$1/$fileName` ./
tar -xvf ./$fileName
cd shbin
sh start.sh