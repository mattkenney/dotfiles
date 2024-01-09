""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert
set nocompatible
set autochdir
set backspace=indent,eol,start
set bg=light
set confirm
set cursorline
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
""" file search
""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=clear;grepprg
set isfname=$,_,48-57,@
set path=$PWD/**
set suffixesadd=.java,.ts,.js
set wildignore+=*.class,**/gwt/**
autocmd BufEnter,BufRead *
  \ let s:toplevel=substitute(system("toplevel"), '\n\+$', '', '') |
  \ exec "set path=".escape(escape(s:toplevel, ' '), '\ ')."/**"
""""""""""""""""""""""""""""""""""""""""""""""""""
""" mode hint using background-color
""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd InsertEnter * colorscheme industry
autocmd InsertEnter *
  \ colorscheme industry |
  \ highlight CopilotSuggestion ctermfg=Black ctermbg=LightYellow
"autocmd InsertLeave * colorscheme desert
autocmd InsertLeave * |
  \ colorscheme default |
  \ set bg=light
""""""""""""""""""""""""""""""""""""""""""""""""""
""" colorscheme for vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
  colorscheme github
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" command mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=+ F :silent gr! <args> | copen
command Q :qa
command U :u
command W :w
command Wqa :wqa
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
nnoremap Q :qa<CR>
nnoremap \a  0
nnoremap \b  O<Esc>j
nnoremap \d  :bd<CR>
nnoremap \e  $
nnoremap \f  :copen<CR>
nnoremap \\f :cclose<CR>:noh<CR>
nnoremap \g  :gr! '\<<cword>\>'<CR>
nnoremap \i  :set autoindent<CR>
nnoremap \\i :set noautoindent<CR>
nnoremap \k  :silent !k<CR>:redraw!<CR>
"nnoremap \l  :Bufselect<CR>
nnoremap \l  :BufExplorer<CR>
nnoremap \m  :w<CR>:make<CR>
nnoremap \n  :n<CR>
nnoremap \p  :set wrap linebreak nolist<CR>
nnoremap \\p :set nowrap nolinebreak list<CR>
nnoremap \q  :qa<CR>
nnoremap \r  :Oldfiles! COMMIT_EDITMSG<CR>
nnoremap \w  :w<CR>
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
