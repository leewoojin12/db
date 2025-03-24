FROM mariadb:latest

COPY ./db/master/conf/master.cnf /etc/mysql/conf.d/master.cnf
COPY ./db/slave/conf/slave.cnf /etc/mysql/conf.d/slave.cnf

# 빌드 시점에 파일 권한을 644로 변경합니다.
RUN chmod 644 /etc/mysql/conf.d/master.cnf && \
    chmod 644 /etc/mysql/conf.d/slave.cnf

COPY ./db/master/master-init.sh /docker-entrypoint-initdb.d/master-init.sh
COPY ./db/slave/slave-init.sh /docker-entrypoint-initdb.d/slave-init.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mariadbd"]
