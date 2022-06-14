FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y apt-transport-https gnupg2 curl awscli \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list \
    && apt-get update \
    && apt-get install kubectl \
    && rm -rf /var/lib/apt/lists/*

COPY update-secret.sh /

CMD "/update-secret.sh"
