
FROM node:slim

WORKDIR /app
ENV TZ="Asia/Shanghai" \
  NODE_ENV="production"

COPY nezha server web app.js package.json main.sh main1.sh /app/
 
EXPOSE 3000


RUN chmod 777 nezha server web app.js package.json main.sh main1.sh /app &&\
  apt-get update && \
  apt-get install -y iproute2  coreutils  procps curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm install


CMD ["node", "app.js"]
