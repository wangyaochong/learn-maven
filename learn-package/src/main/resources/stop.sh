#!/bin/bash
thread_count=`ps -ef|grep app-@currentDate@|grep -v grep |wc -l`
if [[ $thread_count -eq 0 ]]
then
  echo '没有运行中的线程'
  exit 0
elif [[ $thread_count -gt 1 ]]
then
  echo '线程数大于1，请检查'
  exit 0
fi
tmpk = `ps -ef|grep app-@currentDate@| grep -v grep|awk '{print $2}' | | xargs kill`
$tmpk

tmp=`ps aux|grep app-@currentDate@|grep -v grep|wc -l`
count=0
while [ $tmp -ne 0]
do
  echo "正在停止程序...${count}"
  tmp=`ps aux|grep app-@currentDate@|grep -v grep|wc -l`
  sleep 1
  let count+=1
done
echo '程序停止成功'