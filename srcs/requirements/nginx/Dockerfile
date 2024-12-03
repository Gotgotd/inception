FROM debian:buster

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install nginx -y &&\
    mkdir -p /etc/nginx/ssl &&\
    apt-get install -y vim curl vim openssl &&\
    apt-get clean &&\
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PO/L=Perpi/O=42/OU=42/CN=gdaignea.42.fr/UID=gautier" &&\
    mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html &&\
    chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]

