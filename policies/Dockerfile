FROM nginx:latest
COPY demo.rego /demo/
COPY policies/data.json /demo/policies/data.json
RUN mkdir /usr/share/nginx/html/bundles
RUN tar -C /demo -zcvf /usr/share/nginx/html/bundle.tar.gz demo.rego policies
