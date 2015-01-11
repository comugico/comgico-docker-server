IMAGES_FOR_BUILD = [
  $iinfo.new(
    'comugico/comugico-docker-server_nginx',
    './containers/_nginx',
    $cinfo.new(
      'comugico-docker-server_nginx',
      '--restart=always -it -p 80:80 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY -e DOCKER_HOST_CERT_PATH=$DOCKER_HOST_CERT_PATH -v '+ENV["DOCKER_HOST_NGINX_CONF"]+':/etc/nginx/conf.docker.d -v $DOCKER_HOST_CERT_PATH:/opt/from_dockerfile/certs'
    )
  ),
  $iinfo.new(
    'shipyard/rethinkdb',
    nil,
    $cinfo.new(
      'shipyard-rethinkdb-data',
      '--restart=always -it --entrypoint /bin/bash'
    )
  ),
  $iinfo.new(
    'shipyard/rethinkdb',
    nil,
    $cinfo.new(
      'shipyard-rethinkdb',
      '--restart=always -it --volumes-from shipyard-rethinkdb-data'
    )
  ),
  $iinfo.new(
    'shipyard/shipyard',
    nil,
    $cinfo.new(
      'shipyard',
      '--restart=always -it --link shipyard-rethinkdb:rethinkdb'
    )
  ),
  $iinfo.new(
    'jchaney/owncloud',
    nil,
    $cinfo.new(
      'owncloud',
      '--restart=always -it'
    )
  )
]
