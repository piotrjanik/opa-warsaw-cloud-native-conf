FROM nginx:latest
COPY ./demo /policies
RUN tar -zcvf /usr/share/nginx/html/bundle.tar.gz /policies
