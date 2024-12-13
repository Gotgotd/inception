FROM debian:buster

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget curl php7.3 php7.3-fpm php7.3-mysql mariadb-client

# Copy PHP configuration
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download and extract WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www && \
    rm /var/www/wordpress-6.0-fr_FR.tar.gz && \
    mv /var/www/wordpress /var/www/html && \
    chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Download and configure WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chmod 755 /usr/local/bin/wp && wp cli update

# Expose php-fpm port
EXPOSE 9000

# Copy auto-configuration script
COPY tools/auto_config.sh /var/www/html/auto_config.sh
RUN chmod +x /var/www/html/auto_config.sh

# Start php-fpm in foreground to keep the container running
#CMD ["php-fpm7.3", "-F"]

#ENTRYPOINT ["sh", "/var/www/html/auto_config.sh"]
CMD ["/bin/bash", "-c", "/var/www/html/auto_config.sh && php-fpm7.3 -F"]
