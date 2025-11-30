FROM  container-registry.oracle.com/os/oraclelinux:10
RUN dnf -y install httpd
EXPOSE 80
USER root
CMD ["httpd", "-D", "FOREGROUND"]

