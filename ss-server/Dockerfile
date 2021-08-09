FROM shadowsocks/shadowsocks-libev

ENV FRP_VERSION 0.37.1
USER root
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz
# COPY frp_${FRP_VERSION}_linux_amd64.tar.gz .
RUN tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frpc \
    && cp frp_${FRP_VERSION}_linux_amd64/frpc* /usr/local/bin/ \
    && chmod +x /usr/local/bin/frpc \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN mkdir /conf
VOLUME /conf
COPY run.sh /frpc

USER nobody
WORKDIR /frpc
ENTRYPOINT ["/bin/sh","run.sh"]
# CMD ["/bin/sh", "-c", "exec frpc -c /conf/frpc.ini & ss-server -s $SERVER_ADDR -p $SERVER_PORT -k ${PASSWORD:-$(hostname)} -m $METHOD -t $TIMEOUT -d $DNS_ADDRS -u $ARGS"]
