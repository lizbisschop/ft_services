# FROM alpine:3.12

# LABEL maintainer lbisscho

# RUN apk update
# RUN apk upgrade
# # RUN vi /etc/apk/repositories
# RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# RUN apk add nginx

# #ADD USER NGINX
# RUN adduser -D -g 'www' www
# RUN mkdir /www
# RUN chown -R www:www /www
# RUN chown -R www:www /var/lib/nginx
# RUN mkdir -p /run/nginx
# COPY nginx.conf /etc/nginx/nginx.conf

# #DOWNLOAD WORDPRESS
# RUN mkdir /www/wordpress
# COPY config.inc.php /www
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz --strip-components=1 -C /www/wordpress
# COPY wp-config.php ./www/

# EXPOSE 5050

# CMD php-fpm7 && ["nginx", "-g", "daemon off;"]

FROM alpine:3.12

LABEL maintainer lbisscho

RUN apk add --no-cache wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# download wordpress
RUN mkdir -p /usr/share/webapps/
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz --strip-components=1 -C /usr/share/webapps/
RUN rm latest.tar.gz

# copy relevant file
COPY wp-config.php /usr/share/webapps/wordpress/wp-config.php
COPY start.sh .
RUN chmod +x ./start.sh

EXPOSE 5050

CMD sh ./start.sh