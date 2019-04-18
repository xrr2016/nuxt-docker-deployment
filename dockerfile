FROM node:lts-alpine as builder

WORKDIR /app
COPY package*.json ./

FROM node:lts-alpine

COPY . .
RUN npm install --production
RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "npm", "start" ]
