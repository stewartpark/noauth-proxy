FROM alpine:3
MAINTAINER Stewart Park <hello@stewartjpark.com>

RUN apk add --no-cache squid
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
