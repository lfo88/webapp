FROM ubuntu

LABEL maintainer='vdli@vdli.com'

RUN apt update

RUN DEBIAN_FRONTEND=noninteractive  apt install nginx git -y

RUN sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default

RUN rm -Rf /var/www/html/*

RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/

#ADD static-website-example /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

