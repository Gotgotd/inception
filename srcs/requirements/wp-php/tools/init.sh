#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root \
	--force

wp config create --allow-root \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PWD} \
	--dbhost=mariadb:3306 --path='/var/www/html'

wp core install --allow-root \
	--url=https://${DOMAIN_NAME} \
	--title="gdaignea's inception site" \
	--admin_user=${WP_ADM} \
	--admin_password=${WP_APWD} \
	--admin_email=fakeadmin@example.com

wp user create --allow-root \
	${WP_USER} fakeuser@example.com \
	--role=editor \
	--user_pass=${WP_UPWD}

exec "$@"