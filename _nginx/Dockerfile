FROM matsumotory/ngx-mruby

RUN apt-get update -y
RUN apt-get install -y nano nmap tree
RUN apt-get install -y curl wget

RUN mkdir --verbose --parents /tmp/from_dockerfile
RUN ln -s /tmp/from_dockerfile ~/tmp

RUN mkdir --verbose --parents /opt/from_dockerfile
RUN ln -s /opt/from_dockerfile ~/docker
RUN mkdir --verbose --parents ~/docker/certs
RUN mkdir --verbose --parents ~/docker/containers

ADD src/nginx.conf /usr/local/nginx/conf/nginx.conf
RUN mkdir --verbose --parents /usr/local/nginx/conf.docker.d

RUN apt-get install -y docker.io

ENV DOCKER_HOST tcp://172.17.42.1:4243
ENV DOCKER_CERT_PATH /opt/from_dockerfile/certs
ENV DOCKER_TLS_VERIFY 0
ENV DOCKER_HOST_CERT_PATH /opt/from_dockerfile/certs

VOLUME ["/opt/from_dockerfile/certs", "/usr/local/nginx/conf.docker.d"]
EXPOSE 80
#CMD nginx -g "daemon off;"
