FROM alpine

LABEL maintainer lbisscho

RUN apk update && apk upgrade \
	apk add nginx openssl openrc openssh supervisor
	
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf

# RUN mv /etc/nginx/nginx.conf /etcnginx/nginx/conf.orig





EXPOSE 80 443

# CMD rc-service nginx start
