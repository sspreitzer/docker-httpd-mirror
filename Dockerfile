FROM centos:7

RUN yum install -y httpd && \
    rm -f /etc/httpd/conf.d/welcome.conf && \
    yum clean all && \
    chmod 770 /run/httpd && \
    sed -i 's|Listen 80|Listen 8080|g' /etc/httpd/conf/httpd.conf && \
    sed -i 's|ErrorLog .*|ErrorLog /dev/stderr|g' /etc/httpd/conf/httpd.conf && \
    sed -i 's|CustomLog .*|CustomLog /dev/stdout combined|g' /etc/httpd/conf/httpd.conf

ADD assets/00-mirror.conf /etc/httpd/conf.d/00-mirror.conf

EXPOSE 8080

VOLUME /var/www/html

USER apache

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
