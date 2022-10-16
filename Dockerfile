ARG TAG=5.2-22.04_beta

FROM ubuntu/squid:${TAG}

ARG DISTRO=jammy

RUN apt update && apt install -y \
        curl \
        gpg \
        apt-transport-https \
    && curl -fsSL https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/openvpn-repo-pkg-keyring.gpg \
    && curl -fsSL https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-${DISTRO}.list >/etc/apt/sources.list.d/openvpn3.list \
    && apt update \
    && apt install -y openvpn3 \
    && apt autoremove -y \
    && apt clean -y
