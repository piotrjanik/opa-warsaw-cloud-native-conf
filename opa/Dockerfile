FROM nginx:latest
COPY ./demo/demo.rego /demo/
COPY ./demo/policies/data.json /demo/policies/data.json
RUN mkdir /usr/share/nginx/html/bundles
RUN tar -C /demo -zcvf /usr/share/nginx/html/bundles/bundle.tar.gz demo.rego policies
