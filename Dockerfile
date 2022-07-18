FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Now build the nginx image
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
