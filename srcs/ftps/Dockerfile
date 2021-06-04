# Using official alpine image as a parent image
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
COPY vsftpd.conf /etc/vsftpd/vsftpd..conf
COPY start.sh .

# Port 20: active mode data transfer. Port 21: explicit FTPS control connections. 
# Port 30000: pasive mode data transfer.
EXPOSE 20 21 21000

CMD sh start.sh

# FROM alpine:3.12

# ENV FTP_USER=lbisscho \
#     FTP_PASS=password \
#     PASV_ADDRESS="192.168.99.210" \
#     PASV_MIN=21000 \
#     PASV_MAX=21002

# RUN apk add --no-cache vsftpd openssl

# RUN mkdir -p /etc/ssl/private && chmod +x /etc/ssl/private

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/ssl/private/vsftpd.key \
#     -out /etc/ssl/certs/vsftpd.crt \
#     -subj "/C=NL/ST=Noord Holland/L=Amsterdam\
# 	/O=Codam/CN=ft_services"

# RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "background=NO" >> /etc/vsftpd/vsftpd.conf \
#     && echo "dirmessage_enable=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "max_clients=10" >> /etc/vsftpd/vsftpd.conf \
#     && echo "max_per_ip=5" >> /etc/vsftpd/vsftpd.conf \
#     && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
#     && echo "passwd_chroot_enable=yes" >> /etc/vsftpd/vsftpd.conf \
#     && echo "pasv_enable=Yes" >> /etc/vsftpd/vsftpd.conf \
#     && echo "listen_ipv6=NO" >> /etc/vsftpd/vsftpd.conf \
#     && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf \
#     && sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf \
#     && echo "rsa_cert_file=/etc/ssl/certs/vsftpd.crt" >> /etc/vsftpd/vsftpd.conf \
#     && echo "rsa_private_key_file=/etc/ssl/private/vsftpd.key" >> /etc/vsftpd/vsftpd.conf \
#     && echo "ssl_enable=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "allow_anon_ssl=NO" >> /etc/vsftpd/vsftpd.conf \
#     && echo "force_local_data_ssl=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "force_local_logins_ssl=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "ssl_tlsv1=YES" >> /etc/vsftpd/vsftpd.conf \
#     && echo "ssl_sslv2=NO" >> /etc/vsftpd/vsftpd.conf \
#     && echo "ssl_sslv3=NO" >> /etc/vsftpd/vsftpd.conf \
#     && echo "require_ssl_reuse=NO" >> /etc/vsftpd/vsftpd.conf \
#     && echo "ssl_ciphers=HIGH" >> /etc/vsftpd/vsftpd.conf

# COPY start.sh .
# RUN chmod +x ./start.sh

# EXPOSE 21 20 30000

# CMD sh ./start.sh