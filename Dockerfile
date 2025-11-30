FROM  container-registry.oracle.com/os/oraclelinux:10
RUN dnf -y install httpd
RUN echo "1.1.1.1  test" > /etc/hosts
EXPOSE 8080
CMD ["httpd", "-D", "FOREGROUND"]

