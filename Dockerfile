FROM node:22-bookworm-slim as runner

WORKDIR /app

COPY backend/* /app

RUN npm install
RUN npx prisma db push
RUN npx tsc
RUN chmod +x /app/run.sh

EXPOSE 3000
VOLUME /app/data

COPY frontend/build/ /app/www/

CMD ["node", "dist/index.js"]