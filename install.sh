#!/bin/bash

if [ -z ${DOCKER_URL} ]; then
  DOCKER_URL="tcp://172.17.42.1:4243"
fi

if [ -z ${DOCKER_HOST_NGINX_CONF} ]; then
  DOCKER_HOST_NGINX_CONF="$(dirname $0 && pwd)/_nginx/example_conf.docker.d"
fi

if [ -z ${DOCKER_CERT_PATH} ]; then
  DOCKER_CERT_PATH=/dev/null
fi

docker build -t s6464/my-docker-platform_installer .
docker run -it --rm -e DOCKER_HOST=$DOCKER_URL -e DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY -e DOCKER_HOST_CERT_PATH=$DOCKER_CERT_PATH -e DOCKER_HOST_NGINX_CONF="$DOCKER_HOST_NGINX_CONF" -v $DOCKER_CERT_PATH:/opt/from_dockerfile/certs s6464/my-docker-platform_installer
