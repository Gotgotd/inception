FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php7.4-fpm php-mysqli curl php-soap vim

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/init.sh /usr/local/bin/init.sh

RUN mkdir -p /run/php

RUN chmod +x /usr/local/bin/init.sh
ENTRYPOINT ["/usr/local/bin/init.sh"]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]