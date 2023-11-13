FROM debian:bullseye

RUN apt-get update && apt-get -y install curl
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

RUN curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mkdir -p /var/www/html
RUN mv adminer-4.8.1.php /var/www/html/index.php

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
