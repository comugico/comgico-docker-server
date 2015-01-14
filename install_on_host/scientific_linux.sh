#!/bin/bash
CURRENT=$(cd $(dirname $0) && pwd)
yum localinstall "http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm" --nogpgcheck
yum install docker-io
