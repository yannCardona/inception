FROM debian:bullseye

RUN apt-get update && apt-get -y install wget
RUN apt-get update && apt-get -y install \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
	&& rm -rf /var/lib/apt/lists/*

COPY www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php

COPY wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
