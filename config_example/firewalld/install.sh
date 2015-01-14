#!/bin/bash
CURRENT=$(cd $(dirname $0) && pwd)
cp ./service.xml /etc/firewalld/services/my-docker-platform.xml
firewall-cmd --reload
firewall-cmd --add-service=my-docker-platform --zone=work --permanent
firewall-cmd --add-service=http --zone=public --permanent
firewall-cmd --list-services --zone=work --permanent
