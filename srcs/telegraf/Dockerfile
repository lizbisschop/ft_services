FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
    apk add curl

RUN apk add --no-cache wget

RUN mkdir /etc/telegraf
#downloading telegraf
RUN wget -nv https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_static_linux_amd64.tar.gz && \
    tar -xf telegraf-1.17.2_static_linux_amd64.tar.gz --strip-components=2 -C . && \
	rm telegraf-1.17.2_static_linux_amd64.tar.gz

COPY telegraf.conf /etc/telegraf

CMD ["telegraf"]
