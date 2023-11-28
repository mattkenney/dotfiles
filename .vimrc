""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert
set nocompatible
set autochdir
set backspace=indent,eol,start
set confirm
set cursorline
set laststatus=2
set mouse=a
set signcolumn=number
set statusline+=\ %l,%c
set statusline+=\ %F
set ttymouse=sgr
set viminfo='32
set wildmenu
set wildmode=longest:full
syntax enable
""""""""""""""""""""""""""""""""""""""""""""""""""
""" push quickfix window always to the bottom
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType qf wincmd J
""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugins via vim-plug - use :PlugInstall to install
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'arthurxavierx/vim-caser' " https://github.com/arthurxavierx/vim-caser#usage gs[.ckpu_]
Plug 'dense-analysis/ale' " realtime linting
Plug 'endel/vim-github-colorscheme'
"Plug 'github/copilot.vim'
Plug 'gpanders/vim-oldfiles'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-vinegar' " file browsing
Plug 'will133/vim-dirdiff'
Plug 'yegappan/bufselect'
call plug#end()
:autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
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
  \ highlight CopilotSuggestion ctermfg=Black ctermbg=LightYellow |
"autocmd InsertLeave * colorscheme desert
autocmd InsertLeave * colorscheme default
""""""""""""""""""""""""""""""""""""""""""""""""""
""" colorscheme for vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff
    colorscheme github
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" command mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=+ F :gr! <args>
command Q :qa
command U :u
command W :w
command Wqa :wqa
""""""""""""""""""""""""""""""""""""""""""""""""""
""" insert mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr><cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap \a <C-o>0
inoremap <silent><expr> \c coc#refresh()
inoremap \e <C-o>$
" avoid frequently used escape sequences: \n \o \r \t \u and \x
inoremap \z  <C-o>:ALEEnable<CR><C-o>:CocEnable<CR>
inoremap \\z <C-o>:ALEDisable<CR><C-o>:CocDisable<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" normal mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-a> <C-b>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gr <Plug>(coc-references)nnoremap \a 0
nnoremap Q :qa<CR>
nnoremap \a  0
nnoremap \b  O<Esc>j
nnoremap \d  :bd<CR>
nnoremap \e  $
nnoremap \f  :copen<CR>
nnoremap \\f :cclose<CR>
nnoremap \g  :gr! '\<<cword>\>'<CR>
nnoremap \h  :call CocActionAsync('doHover')<CR>
nnoremap \i  :set autoindent<CR>
nnoremap \\i :set noautoindent<CR>
nnoremap \k  :silent !k<CR>:redraw!<CR>
nnoremap \l  :Bufselect<CR>
nnoremap \m  :w<CR>:make<CR>
nnoremap \n  :n<CR>
nnoremap \p  :set wrap linebreak nolist<CR>
nnoremap \\p :set nowrap nolinebreak list<CR>
nnoremap \q  :qa<CR>
nnoremap \r  :Oldfiles! COMMIT_EDITMSG<CR>
nnoremap \s  :silent !wt<CR>:redraw!<CR>
nnoremap \w  :w<CR>
nnoremap \z  :ALEEnable<CR>:CocEnable<CR>
nnoremap \\z :ALEDisable<CR>:CocDisable<CR>
