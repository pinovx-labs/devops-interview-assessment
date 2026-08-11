FROM node:18-alpine AS builder

WORKDIR /app
COPY package*./json ./

RUN NPM ci

COPY . .

RUN npm run build



FROM node:18-alpine AS production

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./

RUN npm ci --omit=dev

COPY from=builder /app/dist ./dist 

EXPOSE 3000

CMD ["node", "dist/main.js"] # or ["node", "dist/src/main.js"] as the case may be, because this has been an issue with the startup command in the package.json template used.
