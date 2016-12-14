FROM ubuntu:16.04

WORKDIR /var/www/html
EXPOSE 80

RUN apt-get update && \
    apt-get install -y \
    php7.0 \
    php7.0-fpm \
    nginx \
    python-pip

RUN pip install supervisor

ADD www.conf /etc/php/7.0/fpm/pool.d/
ADD php-fpm.conf /etc/php/7.0/fpm/
ADD nginx.conf /etc/nginx/
ADD supervisord.conf /usr/local/etc/supervisord.conf

RUN mkdir -p /var/log/supervisord
RUN touch /var/log/php-fpm.log
RUN chown www-data:www-data /var/log/php-fpm.log

ADD . /var/www/html/

CMD ["/usr/local/bin/supervisord", "-n", "-c", "/usr/local/etc/supervisord.conf"]
