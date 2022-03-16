#!/bin/bash
cd ../apps/
date=`date +%Y%m%d`
jarFileName=`ls -lt|grep .jar |head -1 |awk '{print $9}'`
if [ ! -n "$jarFileName" ];then
  echo "找不到可以备份的jar包"
  exit 0
fi
cd ../shbin/
echo 备份jar包名称:$jarFileName
rm -rf ../backupTmp
mkdir -p ../backupTmp
mkdir -p ../backupRunning
mkdir -p ../backupTmp/apps
cp -rf ../apps/$jarFileName ../backupTmp/apps
cp ../apps/$jarFileName ../backupTmp/apps
cp -rf ../shbin ../backupTmp

tar -cvzf ../backupRunning/backup-$date.tar ../backupTmp


mkdir -p ../backupOrigin

cp ../app-@profile.name@-@currentDate@.tar ../backupOrigin/backup-$date.tar

if [ -f "../backupRunning/backup-$date.tar" ];then
  echo "备份[/backupRunning/backup-$date.tar]成功！"
  exit 0
else
  echo "备份[/backupRunning/backup-$date.tar]失败！"
  exit 0
fi


if [ -f "../backupOrigin/backup-$date.tar" ];then
  echo "备份[/backupOrigin/backup-$date.tar]成功！"
  exit 0
else
  echo "备份[/backupOrigin/backup-$date.tar]失败！"
  exit 0
fi