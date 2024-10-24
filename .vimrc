""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert
set nocompatible
set autochdir
set background=light
set backspace=indent,eol,start
set confirm
set cursorline
set formatoptions=
set laststatus=2
set modeline
set mouse=a
set noincsearch
set signcolumn=yes
set statusline+=\ %l,%c
set statusline+=\ %F
set viminfo='32
set wildmenu
set wildmode=longest:full
if !has('nvim')
  set ttymouse=sgr
endif
syntax enable
let g:editorconfig = v:false
""""""""""""""""""""""""""""""""""""""""""""""""""
""" quickfix window
""""""""""""""""""""""""""""""""""""""""""""""""""
" always push to the bottom
autocmd FileType qf wincmd J
" close on select
:autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugins via vim-plug - use :PlugInstall to install
""""""""""""""""""""""""""""""""""""""""""""""""""
let useCoc = has('nvim-0.5.0') || has('patch-8.2.0750')
call plug#begin()
Plug 'arthurxavierx/vim-caser' " https://github.com/arthurxavierx/vim-caser#usage gs[.ckpu_]
Plug 'dense-analysis/ale' " realtime linting
Plug 'endel/vim-github-colorscheme'
"Plug 'github/copilot.vim'
Plug 'gpanders/vim-oldfiles'
Plug 'jlanzarotta/bufexplorer'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-vinegar' " file browsing
Plug 'will133/vim-dirdiff'
"Plug 'yegappan/bufselect'
if useCoc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
call plug#end()
highlight CocFloating ctermbg=DarkYellow
""""""""""""""""""""""""""""""""""""""""""""""""""
""" show whitespace & line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=extends:$,nbsp:.,precedes:$,tab:>.,trail:.
set number
""""""""""""""""""""""""""""""""""""""""""""""""""
""" indent & wrap
""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin off
set autoindent
set expandtab
set indentexpr=
set nowrap
set colorcolumn=81
set shiftwidth=2
set tabstop=2
""""""""""""""""""""""""""""""""""""""""""""""""""
""" grep
""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grepprg
""""""""""""""""""""""""""""""""""""""""""""""""""
""" find file
""""""""""""""""""""""""""""""""""""""""""""""""""
set isfname=$,_,48-57,@
set path=$PWD/**
set suffixesadd=.java,.ts,.js
set wildignore+=*.class,**/gwt/**
" set search path to git toplevel
autocmd BufEnter,BufRead *
  \ let s:toplevel=substitute(system("toplevel"), '\n\+$', '', '') |
  \ exec "set path=".escape(escape(s:toplevel, ' '), '\ ')."/**"
""""""""""""""""""""""""""""""""""""""""""""""""""
""" mode hint using background-color
""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd InsertEnter * colorscheme industry
highlight Normal ctermbg=White
autocmd InsertEnter * |
  \ colorscheme industry |
  \ highlight CopilotSuggestion ctermfg=Black ctermbg=LightYellow
"autocmd InsertLeave * colorscheme desert
autocmd InsertLeave * |
  \ colorscheme default |
  \ set background=light |
  \ highlight Normal ctermbg=White
""""""""""""""""""""""""""""""""""""""""""""""""""
""" colorscheme for vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
  colorscheme github
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" command mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=+ F <Cmd>silent grep! <args> | copen
command Q <Cmd>qall
command U <Cmd>undo
command W <Cmd>write
command Wqa <Cmd>wqall
""""""""""""""""""""""""""""""""""""""""""""""""""
""" insert mode mappings
""" Note: avoid frequently used escape sequences:
""" \n \o \r \t \u and \x
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap \a <C-o>0
inoremap \e <C-o>$
""""""""""""""""""""""""""""""""""""""""""""""""""
""" normal mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-a> <C-b>
nnoremap Q <Cmd>qall<CR>
nnoremap \2  <Cmd>set shiftwidth=2<CR><Cmd>set tabstop=2<CR>
nnoremap \3  <Cmd>set shiftwidth=3<CR><Cmd>set tabstop=3<CR>
nnoremap \4  <Cmd>set shiftwidth=4<CR><Cmd>set tabstop=4<CR>
nnoremap \a  0
nnoremap \b  O<Esc>j
nnoremap \d  <Cmd>bdelete<CR>
nnoremap \e  $
nnoremap \f  <Cmd>copen<CR>
nnoremap \\f <Cmd>cclose<CR><Cmd>nohlsearch<CR>
nnoremap \g  <Cmd>silent grep! '\<<cword>\>'<CR><Cmd>copen<CR>
nnoremap \i  <Cmd>set autoindent<CR>
nnoremap \\i <Cmd>set noautoindent<CR>
nnoremap \k  <Cmd>silent !k<CR><Cmd>redraw!<CR>
"nnoremap \l  <Cmd>Bufselect<CR>
nnoremap \l  <Cmd>BufExplorer<CR>
nnoremap \m  <Cmd>write<CR><Cmd>make<CR>
nnoremap \n  <Cmd>next<CR>
nnoremap \p  <Cmd>set wrap linebreak nolist<CR>
nnoremap \\p <Cmd>set nowrap nolinebreak list<CR>
nnoremap \q  <Cmd>qall<CR>
nnoremap \r  <Cmd>Oldfiles! COMMIT_EDITMSG<CR>
nnoremap \w  <Cmd>write<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" https://github.com/neoclide/coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""
if useCoc
  inoremap <expr><cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  inoremap <silent><expr> \c coc#refresh()
  inoremap \z  <C-o><Cmd>ALEEnable<CR><C-o><Cmd>CocEnable<CR>
  inoremap \\z <C-o><Cmd>ALEDisable<CR><C-o><Cmd>CocDisable<CR>
  nnoremap \h  <Cmd>call CocActionAsync('doHover')<CR>
  nnoremap \z  <Cmd>ALEEnable<CR><Cmd>CocEnable<CR>
  nnoremap \\z <Cmd>ALEDisable<CR><Cmd>CocDisable<CR>
  nnoremap <silent> gd <Plug>(coc-definition)
  nnoremap <silent> gr <Plug>(coc-references)
else
  inoremap \z  <C-o><Cmd>ALEEnable<CR>
  inoremap \\z <C-o><Cmd>ALEDisable<CR>
  nnoremap \z  <Cmd>ALEEnable<CR>
  nnoremap \\z <Cmd>ALEDisable<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" visual mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap \a  0
vnoremap \e  $
