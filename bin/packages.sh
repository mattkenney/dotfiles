#!/bin/sh
apt-get install \
    curl \
    exuberant-ctags \
    git \
    openssh-server \
    tmux \
    vim \
    w3m \
    ;
if [ -x /usr/bin/X ]; then
    apt-get install \
        chromium-browser \
        openjdk-11-jdk \
        gparted \
        meld \
        pdfshuffler \
        retext \
        ;
else
    apt-get install \
        openjdk-11-jdk-headless \
        ;
fi
apt-get install default-jre-headless
