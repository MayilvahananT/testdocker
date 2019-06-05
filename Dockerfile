FROM centos
MAINTAINER Mayilvahanan <t.mayilvahanan@abc.com>
RUN yum -y install http php
RUN echo "1.1.1.1  test" > /etc/hosts
