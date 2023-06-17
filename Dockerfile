FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN --mount=type=cache,sharing=private,target=/var/cache/apt \
    --mount=type=cache,sharing=private,target=/var/lib/apt/lists \
    --mount=type=tmpfs,target=/tmp \
    apt update && \
    apt install -y \
    curl openvpn tinyproxy supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY *.ovpn /root

EXPOSE 3128
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
