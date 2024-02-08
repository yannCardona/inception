FROM debian:buster

EXPOSE 9000

# Update and upgrade:
RUN apt-get update -y && apt-get upgrade -y

# Install wget:
RUN apt-get -y install wget

# Install PHP and its dependencies:
RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client

# Copy PHP config file:
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download and unpack wordpress:
WORKDIR /var/www
RUN wget https://wordpress.org/wordpress-6.3.tar.gz -P .
RUN tar -xzf wordpress-6.3.tar.gz && rm -rf wordpress-6.3.tar.gz
RUN chown -R root:root /var/www/wordpress

# Download and install wp-cli:
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy setup script and change persmissions:
COPY ./tools/wordpress_setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress_setup.sh

WORKDIR /

ENTRYPOINT [ "bash", "/usr/local/bin/wordpress_setup.sh" ]
