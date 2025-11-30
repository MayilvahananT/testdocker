FROM  container-registry.oracle.com/os/oraclelinux:10
RUN dnf -y install httpd
USER root
RUN chgrp -R 0 /var/cache && chmod -R g=u /var/cache

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Copy or create content with correct permissions
RUN echo '<html><body><h1>Apache on OpenShift</h1></body></html>' > /var/www/html/index.html && \
    chown apache:apache /var/www/html/index.html

# Expose port 8080 (non-privileged port)
EXPOSE 8080

# Switch to non-root user
USER 1001

# Start Apache
CMD ["httpd", "-D", "FOREGROUND"]
