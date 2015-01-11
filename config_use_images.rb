IMAGES_FOR_BUILD = [
  iinfo.new('comugico/comugico-docker-server_nginx', './containers/_nginx',
    cinfo.new('comugico-docker-server_nginx', '-it -p 80:80 -v '+ENV["DOCKER_HOST_NGINX_CONF"]+':/etc/nginx/conf.docker.d')
  ),
  iinfo.new('shipyard/rethinkdb', nil,
    cinfo.new('shipyard-rethinkdb-data', '-it --entrypoint /bin/bash')
  ),
  iinfo.new('shipyard/rethinkdb', nil,
    cinfo.new('shipyard-rethinkdb', '-it --volumes-from shipyard-rethinkdb-data')
  ),
  iinfo.new('shipyard/shipyard', nil,
    cinfo.new('shipyard', '-it --link shipyard-rethinkdb:rethinkdb')
  ),
  iinfo.new('jchaney/owncloud', nil,
    cinfo.new('owncloud', '-it')
  )
]
