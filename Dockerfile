FROM  container-registry.oracle.com/os/oraclelinux:10
RUN dnf -y install httpd
EXPOSE 8080

CMD ["httpd", "-D", "FOREGROUND"]

