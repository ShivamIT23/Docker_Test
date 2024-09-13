FROM node:16-alpine

WORKDIR /app

COPY ./prisma ./prisma

COPY package.json .
COPY package-lock.json .

RUN npm install

RUN npx prisma generate

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["node", "dist/index.js"]
