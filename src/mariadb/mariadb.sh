#!/bin/sh

service mariadb start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	mysql -uroot -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
	mysql -uroot -e "FLUSH PRIVILEGES;"
	mysql -uroot $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
	
fi

service mariadb stop

exec "$@"
