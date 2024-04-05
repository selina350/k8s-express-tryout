FROM node:20.11.1-slim

WORKDIR /usr/app

ARG node_env=production

ENV NODE_ENV $node_env

COPY package.json package-lock.json /usr/app/
RUN npm install
COPY . /usr/app/

CMD node index.js