FROM node:14-alpine

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5001

CMD [ "node", "app.js" ]
