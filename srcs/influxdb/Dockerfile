FROM alpine:3.12

RUN apk update && \
    apk add influxdb

EXPOSE 8086

COPY setup.sh .
RUN chmod +x setup.sh

CMD sh ./setup.sh