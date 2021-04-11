FROM alpine:3.12

RUN apk update

RUN apk add --no-cache wget

#downloading telegraf
RUN wget -nv https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_static_linux_amd64.tar.gz && \
    tar -xf telegraf-1.17.2_static_linux_amd64.tar.gz --strip-components=2 -C . && \
	rm telegraf-1.17.2_static_linux_amd64.tar.gz

COPY telegraf.conf ./etc/telegraf/
COPY start.sh .
RUN chmod +x start.sh

CMD sh ./start.sh
