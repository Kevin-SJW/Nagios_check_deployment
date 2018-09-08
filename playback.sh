#!/bin/sh
# chkconfig: 123456 90 10
#playback.sh
#
workdir=/usr/work

daemon_start() {
    cd $workdir
    nohup python ./playback.py &
    echo "Server started."
}

daemon_stop() {
    pid=`ps -ef | grep '[p]ython ./playback.py' | awk '{ print $2 }'` 
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
    echo "Usage: /etc/init.d/playback.sh {start|stop|restart}"
    exit 1
esac
exit 0

