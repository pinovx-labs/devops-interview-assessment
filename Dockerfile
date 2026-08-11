
FROM node:18-alpine

WORKDIR /app

# copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "start"]