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
set mouse=a
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
autocmd InsertEnter *
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
command -nargs=+ F :silent grep! <args> | copen
command Q :qall
command U :undo
command W :write
command Wqa :wqall
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
nnoremap Q :qall<CR>
nnoremap \2  :set shiftwidth=2<CR>:set tabstop=2<CR>
nnoremap \3  :set shiftwidth=3<CR>:set tabstop=3<CR>
nnoremap \4  :set shiftwidth=4<CR>:set tabstop=4<CR>
nnoremap \a  0
nnoremap \b  O<Esc>j
nnoremap \d  :bdelete<CR>
nnoremap \e  $
nnoremap \f  :copen<CR>
nnoremap \\f :cclose<CR>:nohlsearch<CR>
nnoremap \g  :silent grep! '\<<cword>\>'<CR>:copen<CR>
nnoremap \i  :set autoindent<CR>
nnoremap \\i :set noautoindent<CR>
nnoremap \k  :silent !k<CR>:redraw!<CR>
"nnoremap \l  :Bufselect<CR>
nnoremap \l  :BufExplorer<CR>
nnoremap \m  :write<CR>:make<CR>
nnoremap \n  :next<CR>
nnoremap \p  :set wrap linebreak nolist<CR>
nnoremap \\p :set nowrap nolinebreak list<CR>
nnoremap \q  :qall<CR>
nnoremap \r  :Oldfiles! COMMIT_EDITMSG<CR>
nnoremap \w  :write<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" https://github.com/neoclide/coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""
if useCoc
  inoremap <expr><cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  inoremap <silent><expr> \c coc#refresh()
  inoremap \z  <C-o>:ALEEnable<CR><C-o>:CocEnable<CR>
  inoremap \\z <C-o>:ALEDisable<CR><C-o>:CocDisable<CR>
  nnoremap \h  :call CocActionAsync('doHover')<CR>
  nnoremap \z  :ALEEnable<CR>:CocEnable<CR>
  nnoremap \\z :ALEDisable<CR>:CocDisable<CR>
  nnoremap <silent> gd <Plug>(coc-definition)
  nnoremap <silent> gr <Plug>(coc-references)
else
  inoremap \z  <C-o>:ALEEnable<CR>
  inoremap \\z <C-o>:ALEDisable<CR>
  nnoremap \z  :ALEEnable<CR>
  nnoremap \\z :ALEDisable<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" visual mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap \a  0
vnoremap \e  $
