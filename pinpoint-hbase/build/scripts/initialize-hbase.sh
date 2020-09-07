#!/bin/bash
set -e
set -x

exec /usr/local/bin/backprocess.sh & PID1=$!
#exec sleep 120 & PID1=$!

echo "start hbase"
exec ${HBASE_HOME}/bin/start-hbase.sh && sleep 10

echo "create table"
exec ${HBASE_HOME}/bin/hbase shell ${BASE_DIR}/hbase-create.hbase

echo "script finished"
#exec ${HBASE_HOME}/bin/start-hbase.sh && sleep 10 && ${HBASE_HOME}/bin/hbase shell ${BASE_DIR}/hbase-create.hbase
exec  kill -9 $PID1
echo "script finished"



