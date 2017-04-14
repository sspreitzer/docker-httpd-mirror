FROM centos:7

RUN yum install -y httpd && \
    rm -f /etc/httpd/conf.d/welcome.conf && \
    yum clean all

ADD assets/00-mirror.conf /etc/httpd/conf.d/00-mirror.conf

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
