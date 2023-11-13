FROM debian:bookworm

RUN apt-get update && apt-get install -y python3

RUN mkdir -p /var/www/html

COPY index.html /var/www/html

EXPOSE 1313

WORKDIR /var/www/html

CMD ["python3", "-m", "http.server", "1313"]
