FROM alpine:3.12

RUN apk update
RUN apk add influxdb


COPY setup.sh .
RUN chmod +x setup.sh

EXPOSE 8086

CMD sh ./setup.sh