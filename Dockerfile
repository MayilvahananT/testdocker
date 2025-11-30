FROM container-registry.oracle.com/os/oraclelinux:9-slim
RUN dnf -y install http php
RUN echo "1.1.1.1  test" > /etc/hosts
CMD systemctl start httpd
