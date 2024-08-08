#!/bin/sh

set -e

vim -c ":PlugInstall"
vim -c ":CocInstall coc-java coc-json coc-tsserver"
