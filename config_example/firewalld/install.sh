#!/bin/bash
CURRENT=$(cd $(dirname $0) && pwd)
#cp ./service.xml /etc/firewalld/services/my-docker-platform.xml
cp ./service.xml /etc/firewalld/services/comugico-docker-server.xml
firewall-cmd --reload
firewall-cmd --add-interface=docker0 --zone=internal --permanent
#firewall-cmd --add-service=my-docker-platform --zone=internal --permanent
firewall-cmd --add-service=comugico-docker-server --zone=internal --permanent
firewall-cmd --add-service=http --zone=public --permanent
firewall-cmd --list-services --zone=internal --permanent
