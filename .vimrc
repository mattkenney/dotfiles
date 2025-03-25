""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set autochdir
set background=light
set backspace=indent,eol,start
"set clipboard=unnamed
set confirm
set cursorline
set formatoptions=
set laststatus=2
set modeline
set mouse=a
"set mouse=nv
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
let usePlug = !empty(globpath(&rtp, '/autoload/plug.vim'))
let useCoc = usePlug && (has('nvim-0.5.0') || has('patch-8.2.0750'))
if usePlug
  call plug#begin()
  Plug 'AndrewRadev/linediff.vim'
  Plug 'arthurxavierx/vim-caser' " https://github.com/arthurxavierx/vim-caser#usage gs[.ckpu_]
  Plug 'dense-analysis/ale' " realtime linting
  Plug 'endel/vim-github-colorscheme'
  "Plug 'github/copilot.vim'
  Plug 'gpanders/vim-oldfiles'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-vinegar' " file browsing
  Plug 'uiiaoo/java-syntax.vim'
  Plug 'will133/vim-dirdiff'
  "Plug 'yegappan/bufselect'
  if useCoc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif
  call plug#end()
  highlight CocFloating ctermbg=DarkYellow
endif
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
set makeprg=makeprg
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
colorscheme default
if has('nvim')
  highlight Normal ctermbg=None guibg=None
  autocmd InsertEnter *
    \ colorscheme industry |
    \ highlight CopilotSuggestion ctermfg=Black ctermbg=LightYellow
  autocmd InsertLeave *
    \ colorscheme default |
    \ set background=light |
    \ highlight Normal ctermbg=None guibg=None
else
  highlight Normal ctermbg=None
  autocmd InsertEnter *
    \ colorscheme industry |
    \ highlight CopilotSuggestion ctermfg=Black ctermbg=LightYellow
  autocmd InsertLeave *
    \ colorscheme default |
    \ set background=light |
    \ highlight Normal ctermbg=None
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" colorscheme for vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""
if &diff && usePlug
  colorscheme github
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" command mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=+ F :silent grep! <args> | copen | redraw!
command Q :qall
command U :undo
command W :write
command Wqa :wqall
""""""""""""""""""""""""""""""""""""""""""""""""""
""" insert mode mappings
""" Note: avoid frequently used escape sequences:
""" \n \o \r \t \u and \x
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap \a <C-o>0
inoremap \e <C-o>$
inoremap \s  <C-o><Cmd>set mouse=a<CR>
inoremap \\s <C-o><Cmd>set mouse=nv<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" normal mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap Q <Cmd>qall<CR>
nnoremap \2  <Cmd>set shiftwidth=2<CR><Cmd>set tabstop=2<CR>
nnoremap \3  <Cmd>set shiftwidth=3<CR><Cmd>set tabstop=3<CR>
nnoremap \4  <Cmd>set shiftwidth=4<CR><Cmd>set tabstop=4<CR>
nnoremap \a  0
nnoremap \b  O<Esc>j
nnoremap \\b o<Esc>
nnoremap \c  <Cmd>redraw!<CR>
nnoremap \d  <Cmd>bdelete<CR>
nnoremap \e  $
nnoremap \f  <Cmd>copen<CR>
nnoremap \\f <Cmd>cclose<CR><Cmd>nohlsearch<CR>
nnoremap \g  <Cmd>silent grep! '\<<cword>\>'<CR><Cmd>copen<CR><Cmd>redraw!<CR>
nnoremap \i  <Cmd>set autoindent<CR>
nnoremap \\i <Cmd>set noautoindent<CR>
nnoremap \k  <Cmd>silent !k<CR><Cmd>redraw!<CR>
nnoremap \m  <Cmd>write<CR><Cmd>make<CR>
nnoremap \n  <Cmd>next<CR>
nnoremap \p  <Cmd>set wrap linebreak nolist<CR>
nnoremap \\p <Cmd>set nowrap nolinebreak list<CR>
nnoremap \q  <Cmd>qall<CR>
nnoremap \s  <Cmd>set mouse=a<CR>
nnoremap \\s <Cmd>set mouse=nv<CR>
nnoremap \w  <Cmd>write<CR>
if usePlug
  "nnoremap \l  <Cmd>Bufselect<CR>
  nnoremap \l  <Cmd>BufExplorer<CR>
  nnoremap \r  <Cmd>Oldfiles! COMMIT_EDITMSG<CR>
else
  nnoremap -   <Cmd>Explore<CR>
  nnoremap \l  <Cmd>buffers<CR>
  nnoremap \r  <Cmd>browse oldfiles<CR>
endif
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
elseif usePlug
  inoremap \z  <C-o><Cmd>ALEEnable<CR>
  inoremap \\z <C-o><Cmd>ALEDisable<CR>
  nnoremap \z  <Cmd>ALEEnable<CR>
  nnoremap \\z <Cmd>ALEDisable<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" visual mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-a> 0
vnoremap <C-e> $
vnoremap \a  0
vnoremap \e  $
""""""""""""""""""""""""""""""""""""""""""""""""""
""" FX - apply external command just to the selection, not full lines
""""""""""""""""""""""""""""""""""""""""""""""""""
command! -range -nargs=1 FX :<line1>,<line2>call FX(<q-args>)
function! FX(fxcmd) range
  let saved_z = @z
  normal! gv"zy
  let txtin = @z
  let tmpin = tempname()
  let tmpout = tempname()
  call writefile(split(txtin, "\n"), tmpin)
  call system(a:fxcmd . ' < ' . shellescape(tmpin) . ' > ' . shellescape(tmpout))
  let txtout = join(readfile(tmpout), "\n")
  call delete(tmpin)
  call delete(tmpout)
  let @z = txtout
  normal! gv"zp
  let @z = saved_z
endfunction
