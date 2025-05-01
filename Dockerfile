FROM node:18-bullseye

WORKDIR /app

RUN npm install -g @angular/cli@15.0.3

COPY angular-site/wsu-hw-ng-main/package*.json ./

RUN npm install

COPY angular-site/wsu-hw-ng-main/ ./

CMD ["ng", "serve", "--host", "0.0.0.0"]

