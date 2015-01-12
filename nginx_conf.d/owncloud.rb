return `docker inspect -format="{{ .NetworkSettings.IPAddress }}" owncloud`
