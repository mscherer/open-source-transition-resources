FROM fedora:33
RUN dnf install -y nginx hugo rubygem-asciidoctor-pdf && dnf clean all -y

USER 1000
RUN ./publish.sh

RUN hugo
EXPOSE 8080
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY public /var/www/html
EXEC /usr/bin/nginx 
