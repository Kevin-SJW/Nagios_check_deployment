#! /bin/bash
# author sjw
# time 2018-1-15
# program : 判断进程是否存在，并重新启动
#echo $pro
pro=analysis_dian.py
#echo $init
init=/etc/init.d
OK=0 
WARNING=1 
CRITICAL=2 
UNKNOWN=3
res=2
export res 
function check_r_dian(){
  res=0
  count=`ps -ef |grep ${pro} |grep -v "grep" |wc -l`
  #echo $count
  if [ 1 == $count ];then
     res=$OK
  fi
  if [ 0 == $count ];then
    #sudo service r_ais restart
    out='the service is restart'
    #echo $out
    res=$CRITICAL
    nohup python /etc/init.d/${pro} &
  fi
}
check_r_dian;
#cho $res
if [ $res == 0 ];then
  echo "OK-analysis_dian.py is ok"
  exit 0
elif [ $res == 2 ];then
  echo "CRITICAL –analysis_dian.py is critical"
  exit 2
elif [ $res == 1 ];then
  echo "WARNING – analysis_dian.py is warning."
  exit 1
fi


