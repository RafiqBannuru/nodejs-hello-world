# Step 1
FROM node:14 as build-step
WORKDIR /usr/src/app
COPY package*.json index.js ./
RUN npm install
EXPOSE 80
CMD ["node", "index.js"]
# Stage 2
FROM nginx:latest
COPY --from=build-step /usr/src/app/index.js /usr/share/nginx/html

