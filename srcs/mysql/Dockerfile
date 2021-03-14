# Using official alpine image as a parent image
FROM alpine:3.12

# Getting the updates for alpine
RUN apk update

# Adding new packages
RUN apk add --no-cache mysql mysql-client

# Create new user
RUN adduser -D 'user' -g mysql

# mysql config
COPY my.cnf /etc/
VOLUME /var/lib/mysql

# The default port for the classic MySQL protocol
EXPOSE 3306

# Start program
CMD	sh start.sh