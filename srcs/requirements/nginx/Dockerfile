FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \ 
    apt-get install nginx -y && \ 
    mkdir -p /etc/nginx/ssl && \ 
    apt-get install -y curl vim openssl && \ 
    apt-get clean && \ 
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/0=42/CN=dabae.42.fr/UID=dabae" && \ 
    mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

RUN chmod 775 /var/www/html && chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
