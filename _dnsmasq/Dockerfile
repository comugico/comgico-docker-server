FROM centos:centos7

RUN yum update -y
RUN yum install -y nano nmap tree
RUN yum install -y curl wget

RUN mkdir --verbose --parents /tmp/from_dockerfile
RUN ln -s /tmp/from_dockerfile ~/tmp

RUN yum install -y dnsmasq
ADD src/dnsmasq.docker.conf /etc/dnsmasq.docker.conf
ADD src/resolv.dnsmasq.conf /etc/resolv.dnsmasq.conf
RUN echo "conf-file=/etc/dnsmasq.docker.conf" >> /etc/dnsmasq.conf

VOLUME ["/etc/dnsmasq.d"]
EXPOSE 53
CMD dnsmasq --no-daemon
