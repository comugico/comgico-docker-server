FROM centos:centos7

RUN yum update -y
RUN yum install -y nano nmap tree
RUN yum install -y curl wget

RUN mkdir --verbose --parents /tmp/from_dockerfile
RUN ln -s /tmp/from_dockerfile ~/tmp

RUN wget "http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm" -O ~/tmp/repo.rpm
RUN yum localinstall -y ~/tmp/repo.rpm
RUN yum install -y nginx

ADD docker.conf /etc/nginx/conf.d/docker.conf
RUN mkdir --verbose --parents /etc/nginx/conf.docker.d

VOLUME ["/etc/nginx/conf.docker.d"]
EXPOSE 80
CMD nginx -g "daemon off;"
