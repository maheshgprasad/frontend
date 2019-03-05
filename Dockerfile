FROM node:8.15.1-alpine as builder
WORKDIR /usr/app
COPY package.json .
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
