FROM alpine:3.12

LABEL maintainer lbisscho

ENV MYSQL_ROOT_PASSWORD=admin
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=admin

RUN apk add --no-cache mysql mysql-client
RUN addgroup mysql mysql

# RUN mkdir -p /tmp
# COPY wordpress.sql /tmp/wordpress.sql
# COPY my.cnf /etc/mysql/my.cnf
# COPY init_1.sh /tmp/init_1.sh
# COPY init_2.sh /tmp/init_2.sh
# RUN chmod +x /tmp/init_1.sh
# RUN chmod =x /tmp/init_2.sh

EXPOSE 3306

CMD sh /tmp/init.sh