FROM  container-registry.oracle.com/os/oraclelinux:10
RUN dnf -y install httpd
USER root

RUN useradd -u 1001 -g 0 -s /bin/bash -d /var/www apache1
RUN groupadd -g 1001 apache1
RUN chown -R 1001:0 /var/www /var/run/httpd /var/log/httpd /etc/httpd /etc/httpd/logs/
RUN chmod -R g+rwx /var/www /var/run/httpd /var/log/httpd /etc/httpd /etc/httpd/logs/
    
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Copy or create content with correct permissions
RUN echo '<html><body><h1>Apache on OpenShift</h1></body></html>' > /var/www/html/index.html && \
    chown 1001:0 /var/www/html/index.html

# Expose port 8080 (non-privileged port)
# EXPOSE 8080

# Switch to non-root user
USER 1001

# Start Apache
CMD ["httpd", "-D", "FOREGROUND"]
