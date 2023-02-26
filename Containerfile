FROM registry.access.redhat.com/ubi9/ubi-init

# Run commands
RUN dnf -y update && dnf -y install nginx && dnf -y clean all && systemctl enable nginx 
RUN mkdir /usr/share/nginx/virtual.host

COPY nginx.conf /etc/nginx/
COPY virtual.host.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/virtual.host/

EXPOSE 80

