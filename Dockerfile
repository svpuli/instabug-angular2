FROM node:10 as build-stage
COPY . /app
WORKDIR /app
RUN npm install
EXPOSE 4200 49152
RUN npx ng build

FROM nginx:mainline
COPY --from=build-stage /app/dist/ /usr/share/nginx/html
COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf