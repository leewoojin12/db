#!/bin/bash


sleep 10

chmod 644 /etc/mysql/conf.d/slave.cnf

master_log_file=`mariadb -h edulink --port 3306 -uroot -pqwer1234 -e "show master status\G" | grep mysqld-bin | awk '{print $2}'`

echo ${master_log_file}

master_log_pos=`mariadb -h edulink -uroot -pqwer1234 -e "show master status\G" | grep Position | awk '{print $2}'`

echo ${master_log_pos}


mariadb -uroot -pqwer1234 -e "stop slave;"
mariadb -uroot -pqwer1234 -e "CHANGE MASTER TO MASTER_HOST='edulink', MASTER_USER='slave_user', MASTER_PASSWORD='qwer1234', MASTER_LOG_FILE='${master_log_file}', MASTER_LOG_POS=${master_log_pos} ,master_port=3306;"
mariadb -uroot -pqwer1234 -e "start slave;"




