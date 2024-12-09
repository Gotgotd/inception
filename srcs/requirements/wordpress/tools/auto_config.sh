#!/bin/bash

# Wait for MariaDB to be ready
while ! mysqladmin ping -h mariadb --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

# Navigate to the WordPress installation directory
cd /var/www/html

# Ensure WP-CLI is installed
if [ ! -f wp-cli.phar ]; then
    echo "Downloading WP-CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
else
    echo "WP-CLI is already installed."
fi

# Ensure WordPress core files are downloaded
if [ ! -f wp-includes/version.php ]; then
    echo "Downloading WordPress core files..."
    ./wp-cli.phar core download --allow-root
else
    echo "WordPress core files are already present."
fi

# Ensure wp-config.php is created
if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php..."
    ./wp-cli.phar config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306 --allow-root
else
    echo "wp-config.php already exists."
fi

# Reset the database if WordPress is already installed
if ./wp-cli.phar core is-installed --allow-root; then
    echo "Resetting existing WordPress installation..."
    ./wp-cli.phar db reset --yes --allow-root
fi

# Install WordPress if not already installed
if ! ./wp-cli.phar core is-installed --allow-root; then
    echo "Installing WordPress..."
    ./wp-cli.phar core install --url=${DOMAIN_NAME} --title=${SITE_NAME} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root
else
    echo "WordPress is already installed."
fi

# Create a WordPress user if it doesn't already exist
if ! ./wp-cli.phar user get ${USER_ID} --allow-root > /dev/null 2>&1; then
    echo "Creating a new WordPress user..."
    ./wp-cli.phar user create ${USER_ID} ${USER_EMAIL} --role=editor --user_pass=${USER_PASSWORD} --allow-root
else
    echo "WordPress user ${USER_ID} already exists."
fi

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm7.3 -F

