#!/bin/sh
# chkconfig: 123456 90 10
#trackAnalysisServer.sh
#
workdir=/usr/work

daemon_start() {
    cd $workdir
    nohup python ./trackAnalysisServer.py &
    echo "Server started."
}

daemon_stop() {
    pid=`ps -ef | grep '[p]ython ./trackAnalysisServer.py' | awk '{ print $2 }'` 
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
    echo "Usage: /etc/init.d/trackAnalysisServer.sh {start|stop|restart}"
    exit 1
esac
exit 0

