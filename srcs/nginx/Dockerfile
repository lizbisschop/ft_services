FROM alpine:3.12

LABEL maintainer lbisscho

RUN apk update
RUN apk upgrade
RUN apk add nginx

RUN apk add openssl
RUN apk add openssh
	
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
RUN mkdir -p /run/nginx

#CREATING SSL CERTIFICATE
RUN ssh-keygen -A
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# add ssh user & config
RUN addgroup ssh && adduser -DH -G ssh test && \
	echo "test:test" | chpasswd && \
	ssh-keygen -A
COPY srcs/sshd_config /etc/ssh/sshd_config

EXPOSE 80 443 22

CMD bash start.sh
