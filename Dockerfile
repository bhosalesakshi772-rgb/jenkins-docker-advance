
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev

FROM node:20-alpine AS production
WORKDIR /app

ARG BUILD_ID
ARG GIT_COMMIT

ENV NODE_ENV=production
ENV BUILD_ID=${BUILD_ID}
ENV GIT_COMMIT=${GIT_COMMIT}

COPY --from=builder /app/node_modules ./node_modules
COPY server.js package.json ./

EXPOSE 3000
CMD ["npm", "start"]

