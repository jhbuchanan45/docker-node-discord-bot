FROM node:13.11.0-alpine

RUN apk add  --no-cache -U \
    git \
    bash

VOLUME "/bot-files"

WORKDIR /bot-files
# bundle scripts for bot (now in bot source)
COPY ./*.sh /bot-files

RUN git clone https://github.com/BobertoBobert/QUB-Computing-Discord.git
RUN cp -r /bot-files/QUB-Computing-Discord/. /bot-files
RUN rm -r ./QUB-Computing-Discord/*
RUN chmod -R 774 /bot-files
RUN npm install

CMD ["node", "index.js"]