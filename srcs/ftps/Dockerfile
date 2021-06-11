# FROM    alpine:3.12

# # install packages
# RUN		apk update; \
#         apk add vsftpd; \
#         apk add openssl

# # SSL
# RUN		openssl req -x509 -days 365 -newkey rsa:2048 -nodes -sha256 \
# 		-out /etc/ssl/certs/vsftpd.crt \
# 		-keyout	/etc/ssl/private/vsftpd.key \
# 		-subj "/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=ftps"; \
# 		chmod 775 /etc/ssl/private/vsftpd.key; \
# 		chmod 775 /etc/ssl/certs/vsftpd.crt

# # vsftpd config file
# COPY	/srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

# RUN		mkdir -p /var/ftps; \
# 		adduser -D lbisscho -h var/ftps; \
# 		echo "lbisscho:password" | chpasswd

# COPY    /srcs/startup.sh /tmp/startup.sh
# RUN     chmod +x /tmp/startup.sh

# EXPOSE  20 21 21000

# CMD     ./tmp/startup.sh

FROM alpine:3.12

# Getting the updates for alpine
RUN apk update

# install packages
RUN		apk update; \
        apk add vsftpd; \
        apk add openssl

# SSL
RUN		openssl req -x509 -days 365 -newkey rsa:2048 -nodes -sha256 \
		-out /etc/ssl/certs/vsftpd.crt \
		-keyout	/etc/ssl/private/vsftpd.key \
		-subj "/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=ftps-svc"; \
		chmod 775 /etc/ssl/private/vsftpd.key; \
		chmod 775 /etc/ssl/certs/vsftpd.crt

# vsftpd config
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN		mkdir -p /var/ftps; \
		adduser -D lbisscho -h var/ftps; \
		echo "lbisscho:password" | chpasswd

COPY start.sh .
RUN		chmod +x start.sh

EXPOSE 20 21 21000

CMD sh start.sh