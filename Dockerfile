FROM node:lts-alpine

LABEL version="1.0" description="node image"

WORKDIR /usr/ioasys-nest-first-app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]

