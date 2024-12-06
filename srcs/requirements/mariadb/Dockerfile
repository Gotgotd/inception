FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y mariadb-server && \ 
    apt-get clean && \ 
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

COPY tools/entrypoint.sh /home/gautier/entrypoint.sh

RUN chmod +x /home/gautier/entrypoint.sh
ENTRYPOINT ["sh", "/home/gautier/entrypoint.sh"]
