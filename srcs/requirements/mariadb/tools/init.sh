#!/bin/bash

echo "Starting MariaDB..."
service mariadb start

sleep 2

#echo "Creating user..."
#mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PWD}';"
#mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"

#mysql -e "FLUSH PRIVILEGES;"

#echo "Generating database..."
#mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
if [ -f /var/run/mysqld/mysqld.pid ]; then
    rm -f /var/run/mysqld/mysqld.pid
fi

# Vérifier si la base de données existe déjà
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
    echo "Creating database and user..."
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PWD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';"
    mysql -e "FLUSH PRIVILEGES;"
else
    echo "Database already exists, skipping initialization."
fi

echo "Stopping MariaDB..."
mysqladmin -u root shutdown

exec "$@"