FROM node:20.11.1-slim

WORKDIR /usr/app

COPY package.json package-lock.json /usr/app/
RUN npm install
COPY . /usr/app/

CMD npm start