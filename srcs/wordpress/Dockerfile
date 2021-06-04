# FROM alpine:3.12


# RUN apk update
# RUN apk upgrade
# # RUN vi /etc/apk/repositories
# RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# RUN apk add nginx


# #DOWNLOAD WORDPRESS
# RUN mkdir /www/wordpress
# COPY config.inc.php /www
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz --strip-components=1 -C /www/wordpress
# COPY wp-config.php ./www/

# EXPOSE 5050

# CMD php-fpm7 && ["nginx", "-g", "daemon off;"]

FROM alpine:3.12

# RUN apk add --no-cache curl wget mysql-client php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk update && \
    apk add nginx && \
    apk add mysql-client && \
    apk add wget && \
    apk add curl && \
    apk add jq && \
    apk add php7 php7-json php7-fpm php7-session php7-mysqli php7-mbstring php7-phar

RUN apk add nginx
# #ADD USER NGINX
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p var/run/nginx

# download wordpress
# RUN mkdir -p /usr/share/webapps/
RUN wget -c https://wordpress.org/wordpress-5.5.3.tar.gz
RUN tar -xzvf wordpress-5.5.3.tar.gz --strip-components=1 -C /www/
# RUN rm latest.tar.gz 

# COPY	/srcs/php-fpm.conf /etc/php7/php-fpm.conf


# RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf
# COPY index.html /www

RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar  && \
	mv wp-cli.phar /usr/local/bin/wp
# RUN php wp-cli.phar
# 	wp core download --allow-root && \
# 	service mysql restart && \
# 	mysql < var/www/html/wordpress/phpmyadmin/sql/create_tables.sql && \
#     wp core install --allow-root --url=192.168.99.210:5050 --title=ft_sevices --admin_user=mysql --admin_password=password \ 
# 	--admin_email=mysql@student.codam.nl --skip-email

# copy relevant fileRUN chmod
# COPY wp-config.php /www
# COPY /usr/share/webapps/index.php /usr/share/webapps/wordpress
COPY wp-config.php /www/wp-config.php
# RUN chmod 755 /www/wp-config.php
COPY setup.sh .
RUN chmod +x ./setup.sh

EXPOSE 5050

CMD sh ./setup.sh