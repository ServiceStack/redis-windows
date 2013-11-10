#! /bin/sh
### BEGIN INIT INFO
# Provides:     redis-server
# Required-Start:   $syslog
# Required-Stop:    $syslog
# Should-Start:     $local_fs
# Should-Stop:      $local_fs
# Default-Start:    2 3 4 5
# Default-Stop:     0 1 6
# Short-Description:    redis-server - Persistent key-value db
# Description:      redis-server - Persistent key-value db
### END INIT INFO


PATH=/opt/redis/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=`which redis-server`
REDIS_CLI=`which redis-cli`
CONFIG_FILE=/etc/redis/6379.conf
DAEMON_ARGS="$CONFIG_FILE"
NAME=redis-server
DESC=redis-server
PIDFILE=/var/run/redis.pid
LOGFILE=/var/log/redis.log

test -x $DAEMON || exit 0
test -x $DAEMONBOOTSTRAP || exit 0

set -e

case "$1" in
  start)
    echo -n "Starting $DESC: "
    touch $PIDFILE $LOGFILE
    chown redis:redis $PIDFILE $LOGFILE
    if start-stop-daemon --start --quiet --umask 007 --pidfile $PIDFILE --chuid redis:redis --exec $DAEMON -- $DAEMON_ARGS
    then
        echo "$NAME."
    else
        echo "failed"
    fi
    ;;
  stop)
    echo "Stopping $DESC"
    if [ ! -e "$PIDFILE" ]
    then
      echo "failed"
    else
      LISTENING_PORT=`grep -E "^ *port +([0-9]+) *$" "$CONFIG_FILE" | grep -Eo "[0-9]+"`
      $REDIS_CLI -p $LISTENING_PORT SHUTDOWN
      #rm -f $PIDFILE
    fi
    ;;

  restart|force-reload)
    ${0} stop
    ${0} start
    ;;
  *)
    echo "Usage: /etc/init.d/$NAME {start|stop|restart|force-reload}" >&2
    exit 1
    ;;
esac

exit 0
