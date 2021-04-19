FROM alpine:3.12

RUN apk update && \
	apk add mysql && \
	apk add mysql-client

RUN addgroup mysql mysql
# RUN adduser -D 'mysql' -g mysql

# Copy files to container
COPY my.cnf /etc/my.cnf
COPY setup.sh /tmp/setup.sh
# COPY ../mysql/create_tables /tmp/

# Set premission to executable
RUN chmod +x /tmp/setup.sh

VOLUME /var/lib/mysql

# Open port
EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/tmp/setup.sh"]