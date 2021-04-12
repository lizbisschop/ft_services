FROM alpine:3.12

RUN apk update && \
	apk upgrade && \
	apk add wget && \
	apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.5.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.5.3.linux-amd64.tar.gz

EXPOSE 3000

# CMD ["grafana-server"]
CMD cd grafana-7.5.3 && ./bin/grafana-server