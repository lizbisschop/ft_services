FROM alpine

LABEL maintainer lbisscho

RUN apk update && apk upgrade
RUN apk add nginx
	
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
# RUN mkdir -p /run/nginx


EXPOSE 80 443

# CMD nginx -g 'daemon off;'
