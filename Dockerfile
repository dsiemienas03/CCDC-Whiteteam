FROM ubuntu:24.04 AS patch

COPY ca-palo.crt /usr/share/ca-certificates

RUN \
    apt-get update ;\
    apt-get install ca-certificates ;\
    update-ca-certificates ;\
    apt-get install -y --no-install-recommends \
    apt-utils ;\
    \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip ;\
    \
    pip install --break-system-packages\
    http.server ;\
    mkdir /serve ;\
    rm -rf /var/lib/apt/lists/*

WORKDIR /serve
SHELL [ "/bin/bash" ]