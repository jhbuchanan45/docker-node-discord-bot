FROM node:13.11.0-alpine

RUN apk add  --no-cache -U \
    git \
    bash

VOLUME "/bot-files"

WORKDIR /bot-files
# bundle scripts for bot (now in bot source)
# COPY ./*.sh /bot-files

# clones only main (production branch)
RUN git clone --branch main --single-branch https://github.com/BobertoBobert/QUB-Computing-Discord.git /bot-files
RUN chmod -R 774 /bot-files
RUN npm install

CMD ["node", "index.js"]