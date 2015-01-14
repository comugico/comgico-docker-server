#!/bin/bash
CURRENT=$(cd $(dirname $0) && pwd)
firewall-cmd --reload
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 4243 -j REJECT
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 1 -p tcp --dport 4243 -i docker0 -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 2 -p tcp --dport 4243 -s 172.17.42.0/24 -j ACCEPT
firewall-cmd --reload
firewall-cmd --permanent --add-service=http --zone=public
firewall-cmd --permanent --list-services --zone=public
firewall-cmd --permanent --direct --get-all-passthroughs
