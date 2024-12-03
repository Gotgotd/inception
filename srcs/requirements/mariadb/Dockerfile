FROM debian:buster


RUN apt update -y && apt upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
   
COPY conf/mycnf.conf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

COPY tools/entrypoint.sh /home/gautier/entrypoint.sh

RUN chmod +x /home/gautier/entrypoint.sh 

RUN chmod -R 755 /var/lib/mysql && \
    chmod 755 /var/run/mysqld /var/lib/mysql

ENTRYPOINT ["sh", "/home/gautier/entrypoint.sh"] 
