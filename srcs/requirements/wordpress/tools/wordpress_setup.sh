#!/bin/bash

# Change working directory to the wordpress path:
cd /var/www/wordpress

# give MariaDB time to lauch correctly:
sleep 10

# generate wp-config.php:
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	wp config create --allow-root \
									  --dbname=$SQL_DATABASE \
									  --dbuser=$SQL_USER \
									  --dbpass=$SQL_PSWD \
									  --dbhost=mariadb:3306
fi

# Core install for wordpress:
wp core install --url="$DOMAIN_NAME" \
							  --title="$SITE_TITLE" \
							  --admin_user="$WP_ADMIN" \
							  --admin_password="$WP_ADMIN_PSWD" \
							  --admin_email="$WP_ADMIN_EMAIL" \
							  --allow-root

# Create wp_user:
wp user create --allow-root $WP_USER $WP_USER_EMAIL \
							   --role=editor \
							   --user_pass=$WP_USER_PSWD \

if [ ! -d /run/php ]; then
	mkdir /run/php
fi

# run php-fpm:
/usr/sbin/php-fpm7.3 -F