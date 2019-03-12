FROM node:alpine AS builder
WORKDIR /app
COPY package* ./
RUN npm i --silent
COPY . .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /app/build /usr/share/nginx/html

