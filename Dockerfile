FROM node:13.11.0-alpine

RUN apk add  --no-cache -U \
    git \
    bash

VOLUME "/bot-files"

WORKDIR /bot-files
# bundle scripts for bot
COPY ./*.sh /bot-files

RUN git clone https://github.com/BobertoBobert/QUB-Computing-Discord.git
RUN mv /bot-files/QUB-Computing-Discord/* /bot-files/QUB-Computing-Discord/.* /bot-files
RUN rm ./QUB-Computing-Discord
RUN chmod -R 774 /bot-files
RUN ./nodeinstall.sh 

CMD ["node", "index.js"]