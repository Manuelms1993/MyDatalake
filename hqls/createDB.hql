CREATE DATABASE IF NOT EXISTS raw;
CREATE DATABASE IF NOT EXISTS stream;
CREATE DATABASE IF NOT EXISTS bi;


/usr/local/bin/startup.sh: line 9:   438 Killed                  ./hiveserver2 --hiveconf hive.server2.enable.doAs=false
cd $HIVE_HOME/bin