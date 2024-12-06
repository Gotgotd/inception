#!/bin/bash

mysqld_safe &
sleep 10

echo "User creation ongoing..."

mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"

mysql -e "FLUSH PRIVILEGES;"

echo "Generating database..."

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

echo "Shutting down MariaDB...."

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld
