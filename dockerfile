FROM ubuntu:bionic
MAINTAINER OneHao <service@onehao.com>

ARG DEBIAN_FRONTEND=noninteractive

COPY ./sources.list  /etc/apt/sources.list

RUN rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/lib/apt/lists/partial \
    && apt-get clean

RUN apt-get update \
        && apt-get install -y  vim lrzsz curl net-tools inetutils-ping zip
#安装编译工具
RUN apt-get install -y repo git-core gitk git-gui gcc-arm-linux-gnueabihf u-boot-tools device-tree-compiler \
        gcc-aarch64-linux-gnu mtools parted libudev-dev libusb-1.0-0-dev python-linaro-image-tools \
        linaro-image-tools gcc-multilib-arm-linux-gnueabihf libssl-dev \
        g+conf autoconf autotools-dev libsigsegv2 m4 intltool libdrm-dev sed curl make

RUN apt-get install -y binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync file bc wget \
        libncurses5 libqt4-dev libglib2.0-dev libgtk2.0-dev libglade2-dev cvs git mercurial rsync openssh-client

RUN apt-get install -y subversion asciidoc w3m dblatex graphviz python-matplotlib libc6-i386 libssl-dev texinfo \
        liblz4-tool genext2fs lib32stdc++6  time lib32gcc-7-dev g++-7 libstdc++-7-dev usbutils
# 用完包管理器后安排打扫卫生可以显著的减少镜像大小
RUN apt-get clean && apt-get autoclean \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
