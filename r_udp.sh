#!/bin/sh
# chkconfig: 123456 90 10
#r_udp.sh
#
workdir=/usr/work

daemon_start() {
    cd $workdir
    nohup python ./r_udp.py &
    echo "Server started."
}

daemon_stop() {
    pid=`ps -ef | grep '[p]ython ./r_udp.py' | awk '{ print $2 }'` 
    echo $pid
    kill $pid
    sleep 2
    echo "Server killed."
}

case "$1" in
  start)
    daemon_start
    ;;
  stop)
    daemon_stop
    ;;
  restart)
    daemon_stop
    daemon_start
    ;;
  *)
    echo "Usage: /etc/init.d/r_udp.sh {start|stop|restart}"
    exit 1
esac
exit 0

