FROM node:4.3.1

RUN mkdir /app
WORKDIR /app
ADD package.json /app/package.json
RUN npm install

ADD . /app
