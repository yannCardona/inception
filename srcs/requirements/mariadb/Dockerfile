FROM debian:buster

EXPOSE 3306

# Update and upgrade:
RUN apt update -y && apt upgrade -y

# Install MariaDB:
RUN apt-get install mariadb-server -y

# Copy config file for mariadb:
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy setup script aand change permissions:
COPY ./tools/mariadb_setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadb_setup.sh

# Run setup script at entrypoint:
ENTRYPOINT [ "bash", "/usr/local/bin/mariadb_setup.sh" ]