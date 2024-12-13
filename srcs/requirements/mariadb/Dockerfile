FROM debian:buster

ENV MYSQL_ROOT_PASSWORD=123
ENV MYSQL_DATABASE=myDataBase
ENV MYSQL_USER=gdaignea
ENV MYSQL_PASSWORD=123

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install -y mariadb-server && \ 
    apt-get clean && \ 
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

COPY tools/entrypoint.sh /home/gdaignea/entrypoint.sh

RUN chmod +x /home/gdaignea/entrypoint.sh
ENTRYPOINT ["sh", "/home/gdaignea/entrypoint.sh"]
