FROM priyansh9879/centos-systemd:7

MAINTAINER "priyansh9879" <priyanshmagotra444@outlook.com

RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

EXPOSE 80

CMD ["/usr/sbin/init"]
