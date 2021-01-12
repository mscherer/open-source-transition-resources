FROM fedora:33
RUN dnf install -y nginx hugo rubygem-asciidoctor-pdf && dnf clean all -y
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY . /var/www/html/ 
USER 1000
WORKDIR /var/www/html/
RUN ./publish.sh

RUN hugo
EXPOSE 8080
EXEC /usr/bin/nginx 
