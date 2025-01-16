FROM ubuntu:24.10 AS patch

RUN \
    apt-get update ;\
    apt-get install -y --no-install-recommends \
    apt-utils


RUN \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip
    
COPY ca-palo.crt /usr/share/ca-certificates/.

RUN \
    echo "ca-palo.crt" >> /etc/ca-certificates.conf ;\
    update-ca-certificates

RUN \
    pip install --break-system-packages \
    simple.http.server ;\
    mkdir /serve

SHELL [ "/bin/bash" ]
WORKDIR /serve