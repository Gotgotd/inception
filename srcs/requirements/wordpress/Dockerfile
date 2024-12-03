FROM debian:buster

# Mise à jour et installation des paquets nécessaires
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php7.3-fpm php7.3-mysql mariadb-client wget curl vim && \
    mkdir -p /var/www && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www && \
    rm /var/www/wordpress-6.0-fr_FR.tar.gz && \
    mv /var/www/wordpress /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Copier le fichier de configuration PHP
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Installer WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Exposer le port PHP-FPM
EXPOSE 9000

# Copier le script d'auto-configuration
COPY tools/auto_config.sh /var/www/html/config.sh
RUN chmod +x /var/www/html/config.sh
RUN ls -l /var/www/html

# Définir l'entrée et les commandes par défaut
ENTRYPOINT ["sh", "/var/www/html/config.sh"]
CMD ["php-fpm7.3", "-F"]
