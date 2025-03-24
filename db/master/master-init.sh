#!/bin/bash

chmod 644 /etc/mysql/conf.d/master.cnf

mariadb -uroot -pqwer1234 -e "CREATE USER 'slave_user'@'%' IDENTIFIED BY 'qwer1234'"
mariadb -uroot -pqwer1234 -e "GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%';"
mariadb -uroot -pqwer1234 -e "FLUSH PRIVILEGES;"


