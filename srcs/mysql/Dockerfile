# Using official alpine image as a parent image
FROM alpine:3.12

# Getting the updates for alpine
RUN apk update

# Adding new packages
RUN apk add --no-cache mysql mysql-client gettext

RUN mkdir -p /var/run/mysqld


RUN addgroup mysql mysql
# Create new user
RUN adduser -D 'admin' -g mysql
RUN chmod 0775 /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld


# mysql config
COPY my.cnf /tmp/ 
RUN envsubst ${MYSQL_USER} ${MYSQL_PASSWORD} < /tmp/my.cnf > /etc/my.cnf
COPY my.cnf /etc/
# COPY start.sh .
COPY create_tables.sql /tmp
VOLUME /var/lib/mysql

# The default port for the classic MySQL protocol
EXPOSE 3306

# Start program
# CMD	sh start.sh