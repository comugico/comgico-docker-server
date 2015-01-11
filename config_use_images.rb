IMAGES_FOR_BUILD = [
  $iinfo.new(
    's6464/my-docker-platform_nginx',
    './containers/_nginx',
    $cinfo.new(
      'my-docker-platform_nginx',
      '--restart=always -it -p 80:80 -v '+ENV["DOCKER_HOST_NGINX_CONF"]+':/etc/nginx/conf.docker.d'
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
  )
]
