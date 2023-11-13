FROM debian:bookworm

RUN apt-get update && apt-get install -y nodejs
RUN apt-get install -y vim
RUN apt-get install -y npm
RUN npm install -g next
RUN yes | npx create-next-app myapp

WORKDIR /myapp

EXPOSE 3000

CMD ["npm", "run", "dev"]
