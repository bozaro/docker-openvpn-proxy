FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN --mount=type=cache,sharing=private,target=/var/cache/apt \
    --mount=type=cache,sharing=private,target=/var/lib/apt/lists \
    --mount=type=tmpfs,target=/tmp \
    apt update && \
    apt install -y \
    curl openvpn tinyproxy supervisor
