#!/bin/bash
iptables -t filter -A INPUT -p tcp --dport 4243 -s 172.17.42.0/24 -j ACCEPT
