FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

COPY mariadb.sh /usr/local/bin/
#COPY wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
#RUN chmod +x /usr/local/bin/wordpress.sql

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
