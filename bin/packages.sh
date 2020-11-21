#!/bin/sh
apt-get install \
    exuberant-ctags \
    git \
    openssh-server \
    rlwrap \
    splitvt \
    tmux \
    vim \
    w3m \
    ;
if type startx >/dev/null 2>&1; then
    apt-get install \
        gparted \
        meld \
        pdfshuffler \
        python3-urwid \
        retext \
        ;
fi
