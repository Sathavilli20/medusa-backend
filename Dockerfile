FROM node:16

WORKDIR /app

COPY some-folder/package*.json ./
RUN npm install

COPY some-folder ./

RUN npm run build

EXPOSE 9000

CMD ["npm", "start"]
