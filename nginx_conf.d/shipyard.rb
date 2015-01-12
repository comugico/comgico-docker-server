return `docker inspect -format="{{ .NetworkSettings.IPAddress }}" shipyard`
