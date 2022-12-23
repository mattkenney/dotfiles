#!/bin/sh

set -e

vim -c ":PlugInstall"
vim -c ":CocInstall coc-json coc-tsserver"
