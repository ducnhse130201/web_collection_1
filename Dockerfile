FROM ubuntu:trusty
ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $PATH:$HTTPD_PREFIX/bin
RUN mkdir -p "$HTTPD_PREFIX" \
	&& chown www-data:www-data "$HTTPD_PREFIX"
WORKDIR $HTTPD_PREFIX

# install httpd runtime dependencies
# https://httpd.apache.org/docs/2.4/install.html#requirements
RUN apt-get update 

RUN apt-get install apache2 php5 -y

COPY . /var/www/html/

RUN find /var/www/html

COPY httpd-foreground /usr/local/bin/

EXPOSE 80
CMD ["httpd-foreground"]

