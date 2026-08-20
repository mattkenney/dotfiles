#!/bin/sh
apt-get install \
    build-essential \
    curl \
    exuberant-ctags \
    git \
    neovim \
    openssh-server \
    ripgrep \
    tmux \
    vim \
    w3m \
    zsh \
    ;
if [ -x /usr/bin/X ]; then
    apt-get install \
        chromium-browser \
        openjdk-21-jdk \
        gparted \
        meld \
        retext \
        ;
else
    apt-get install \
        openjdk-21-jdk-headless \
        ;
fi
apt-get install default-jre-headless
