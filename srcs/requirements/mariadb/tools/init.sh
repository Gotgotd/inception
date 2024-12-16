#!/bin/bash

echo "Starting MariaDB..."
service mariadb start

sleep 2

echo "Creating user..."
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"

mysql -e "FLUSH PRIVILEGES;"

echo "Generating database..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

echo "Stopping MariaDB..."
mysqladmin -u root shutdown

exec "$@"