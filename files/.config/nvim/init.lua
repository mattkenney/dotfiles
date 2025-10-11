vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])
require("config.lazy")
--vim.lsp.enable('config-lsp')
--vim.lsp.config["TypeScript"]
--vim.lsp.enable('TypeScript')
