#!/bin/sh

set -e

mkdir -p ~/.vim/autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.vim/autoload/plug.vim
vim -c ":PlugInstall"
vim -c ":CocInstall coc-java coc-json coc-tsserver"
