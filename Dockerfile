FROM alpine:3.15.4

COPY . /usr/local/bin/

RUN set -ex; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    apk add logrotate tini tzdata curl --no-cache; \
    rm -rf /etc/logrotate.d/*; \
    mv /etc/periodic/daily/* /etc/periodic/15min/; \
    mkdir -p /usr/local/scripts; \
    chmod +x /usr/local/bin/*;

ENTRYPOINT ["/sbin/tini","--","/usr/local/bin/docker-entrypoint.sh"]

CMD ["crond","-f","-l","2"]

