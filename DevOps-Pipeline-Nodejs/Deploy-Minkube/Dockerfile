FROM node:14-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY --chown=node:node . .

USER node

EXPOSE 8000

CMD [ "node", "app.js" ]
