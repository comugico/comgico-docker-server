#!/usr/bin/env ruby
require 'docker'

Docker.url = ENV["DOCKER_HOST"]
Dir::chdir File.dirname(__FILE__)
#puts Docker.info

$iinfo = Struct.new('ImageInfo',     :name, :path, :container)
$cinfo = Struct.new('ContainerInfo', :name, :options)

require './config_use_images.rb'

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
