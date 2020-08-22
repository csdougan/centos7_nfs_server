FROM centos:7
MAINTAINER Craig Dougan <craig.dougan@gmail.com>
# Inspired by https://gitlab.cncf.ci/kubernetes/kubernetes/blob/621c86defba70606f7b52686d6c35ec9e59d4b5e/examples/nfs/exporter/Dockerfile
USER root

COPY start_nfs.sh /root/start_nfs.sh

RUN yum install -y nfs-utils nfs-utils-lib && \
    chmod u+x /root/start_nfs.sh && \
    mkdir -p /nfs


EXPOSE 111/udp 2049/tcp

ENTRYPOINT ["/root/start_nfs.sh"]
