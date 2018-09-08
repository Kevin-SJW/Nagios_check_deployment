#! /bin/bash
# author sjw
# time 2018-1-15
# program : 判断进程是否存在，并重新启动
#echo $pro
pro=r_udp.py
#echo $init
init=/etc/init.d
OK=0 
WARNING=1 
CRITICAL=2 
UNKNOWN=3
res=2
export res 
function check_r_udp(){
  res=0
  count=`ps -ef |grep ${pro} |grep -v "grep" |wc -l`
  #echo $count
  if [ 1 == $count ];then
     res=$OK
  fi
  if [ 0 == $count ];then
    #sudo service r_udp restart
    out='the service is restart'
    #echo $out
    res=$CRITICAL
    nohup python /etc/init.d/${pro} &
  fi
}
check_r_udp;
#cho $res
if [ $res == 0 ];then
  echo "OK-r_udp.py is ok"
  exit 0
elif [ $res == 2 ];then
  echo "CRITICAL –r_udp.py is critical"
  exit 2
elif [ $res == 1 ];then
  echo "WARNING – r_udp.py is warning."
  exit 1
fi
基于对综合服务和RSVP 的问题的分析，人们认识到需要有一个粗颗粒度的QoS 模型，以避免大
型IP 网络为每一个应用流保存预留状态的瓶颈问题，这就是IEFT 后来提出的区分服务（Differentited
Services）模型。区分服务提出的目的是为了对业务的级别作区分，通过区分业务的类型来提供不同质
量的服务。相对于RSVP 来说，Diff-Ser 并不为每个带宽请求保留一条端到端的资源预留通道，而是根
据业务等级的不同来分配相应的带宽资源，这相较于综合服务而言更具有优势。区分服务利用了IPv4 包头中的TOS 字节（或
IPv6 包头的流类型字节），并将它重新命名为DS 字节。DS 字节包含了6 bit DSCP，即区分服务标记和
2 bit 的备用比特，如图三所示。


