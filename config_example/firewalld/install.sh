#!/bin/bash
CURRENT=$(cd $(dirname $0) && pwd)
cp ./service.xml /etc/firewalld/services/my-docker-platform.xml
firewall-cmd --add-service=my-docker-platform --zone=internal --permanent
firewall-cmd --add-service=http --zone=public --permanent
firewall-cmd --reload
firewall-cmd --list-services --zone=internal --permanent
