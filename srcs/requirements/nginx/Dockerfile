FROM debian:buster

EXPOSE 443

# Update and upgrade:
RUN apt update -y && apt upgrade -y

# Install nginx and OpenSSL:
RUN apt install nginx -y && apt install openssl -y

# Create and save TSL certificate:
RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes \
		-out /etc/nginx/ssl/TSL_certificate.crt -keyout /etc/nginx/ssl/TSL_private.key \
		-subj "/C=DE/ST=Berlin/L=Berlin/O=42/OU=42/CN=ycardona.42.fr/UID=ycardona"

# Create directory to store nginx logs:
RUN mkdir -p /run/nginx

# Copy config file to the correct location:
COPY ./conf/nginx.conf /etc/nginx/conf.d/server.conf

# run nginx in the foreground:
CMD [ "nginx", "-g", "daemon off;" ]