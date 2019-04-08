FROM node:11-alpine
ADD ./out /opt/service/out
ADD ./node_modules /opt/service/node_modules
ADD package.json /opt/service
ADD package-lock.json /opt/service
ADD docker-entrypoint.sh /
EXPOSE 8080
WORKDIR /opt/service
ENTRYPOINT [ "/docker-entrypoint.sh" ]
