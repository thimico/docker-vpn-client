FROM thimico/alpine

# install vpn clients
# fix ip command location for the pptp client
RUN set -ex \
    && echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk --update upgrade \
    && apk add ca-certificates pptpclient@testing \
    && ln -s "$(which ip)" /usr/sbin/ip \
    && rm -rf /var/cache/apk/* /tmp/*

COPY content /

ENTRYPOINT ["/entrypoint.sh"]
