FROM alpine:3.12

RUN apk update && \
	apk upgrade && \
	apk add wget

RUN wget https://dl.grafana.com/oss/release/grafana_7.5.3_amd64.deb



EXPOSE 3000

# CMD