FROM node:20.15.0 as build

WORKDIR /app

COPY . ./

RUN npm install

RUN npm install -g @angular/cli

RUN npm run build




FROM nginx:latest

COPY --from=build /app/dist/gke_angular /usr/share/nginx/html

EXPOSE 2628