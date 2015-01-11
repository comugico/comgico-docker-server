#!/usr/bin/env ruby
require 'docker'

Docker.url = ENV["DOCKER_HOST"]
Dir::chdir File.dirname(__FILE__)
#puts Docker.info

iinfo = Struct.new('ImageInfo',     :name, :path, :container)
cinfo = Struct.new('ContainerInfo', :name, :options)

IMAGES_FOR_BUILD = [
  iinfo.new('s6464/my-docker-platform_nginx', './containers/_nginx',
    cinfo.new('my-docker-platform_nginx', '-it -p 80:80 -v '+ENV["DOCKER_HOST_NGINX_CONF"]+':/etc/nginx/conf.docker.d')
  ),
  iinfo.new('shipyard/rethinkdb', nil,
    cinfo.new('shipyard-rethinkdb-data', '-it --entrypoint /bin/bash')
  ),
  iinfo.new('shipyard/rethinkdb', nil,
    cinfo.new('shipyard-rethinkdb', '-it --volumes-from shipyard-rethinkdb-data')
  ),
  iinfo.new('shipyard/shipyard', nil,
    cinfo.new('shipyard', '-it --link shipyard-rethinkdb:rethinkdb')
  )
]

IMAGES_FOR_BUILD.each do |img|
  #if !img.path.nil? && !Docker::Image.exist?(img.name)
  if !img.path.nil? && true
    puts cmd = "docker build --tag #{img.name} #{img.path}"
    puts `#{cmd}`
  end
  
  container = nil
  begin
    container = Docker::Container.get(img.container.name)
    container.start()
  rescue
    puts cmd = "docker run -d --name #{img.container.name} #{img.container.options} #{img.name}"
    puts `#{cmd}`
  end
end

exit 0
