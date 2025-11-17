""""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set autochdir
set background=light
set backspace=indent,eol,start
set confirm
set cursorline
set formatoptions=
set laststatus=2
set modeline
set noincsearch
set regexpengine=2 " prevent ts syntax highlighting hang
set signcolumn=yes
set statusline+=\ %{ClipboardStatus()}%{MouseStatus()}
set statusline+=\ %l,%c
set statusline+=\ %.68F
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
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType py setlocal shiftwidth=4 tabstop=4
""""""""""""""""""""""""""""""""""""""""""""""""""
""" grep & make
""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=grepprg
set makeprg=makeprg
""""""""""""""""""""""""""""""""""""""""""""""""""
""" find file
""""""""""""""""""""""""""""""""""""""""""""""""""
set isfname=$,_,48-57,@
set path=$PWD/**
set suffixesadd=.java,.ts,.tsx,.js,.jsx
set wildignore+=*.class,**/gwt/**
" set search path to git toplevel
autocmd BufEnter,BufRead *
  \ let s:toplevel=substitute(system("toplevel"), '\n\+$', '', '') |
  \ exec "set path=".escape(escape(s:toplevel, ' '), '\ ')."/**"
""""""""""""""""""""""""""""""""""""""""""""""""""
""" mode hint using background-color
""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
  colorscheme zellner
  highlight Normal ctermbg=None
  autocmd InsertEnter *
    \ colorscheme industry
  autocmd InsertLeave *
    \ colorscheme zellner |
    \ set background=light |
    \ highlight Normal ctermbg=None
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" clipboard functions
""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=
function! ClipboardStatus()
  if &clipboard == ''
    return '-'
  else
    return 'C'
  endif
endfunction
function! ClipboardToggle()
  if &clipboard == ''
    set clipboard=unnamed,unnamedplus
  else
    set clipboard=
  endif
  redrawstatus
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""
""" mouse functions
""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nvi
function! MouseStatus()
  if &mouse == ''
    return '-'
  else
    return 'M'
  endif
endfunction
function! MouseToggle()
  if &mouse == ''
    set mouse=nvi
  else
    set mouse=
  endif
  redrawstatus
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""
""" commands
""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=+ F :silent grep! <args> | copen | redraw!
command Q :qall
command U :undo
command W :write
command Wqa :wqall
""""""""""""""""""""""""""""""""""""""""""""""""""
""" command-line mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-a> <Home>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" insert mode mappings
""" Note: avoid frequently used escape sequences:
""" \n \o \r \t \u and \x
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap \a <C-o>0
inoremap \e <C-o>$
inoremap \[ <C-o><Cmd>call ClipboardToggle()<CR>
inoremap \] <C-o><Cmd>call MouseToggle()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""
""" normal mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap Q <Cmd>qall<CR>
nnoremap \<space> a <Esc>
nnoremap \2  <Cmd>set shiftwidth=2<CR><Cmd>set tabstop=2<CR>
nnoremap \4  <Cmd>set shiftwidth=4<CR><Cmd>set tabstop=4<CR>
nnoremap \8  <Cmd>set shiftwidth=8<CR><Cmd>set tabstop=8<CR>
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
nnoremap \s  <Cmd>let @+ = expand('%:p')<CR>
nnoremap \t  <Cmd>set noexpandtab<CR>
nnoremap \\t <Cmd>set expandtab<CR>
nnoremap \v  "0p
nnoremap \w  <Cmd>write<CR>
nnoremap \[  <Cmd>call ClipboardToggle()<CR>
nnoremap \]  <Cmd>call MouseToggle()<CR>
if has('nvim')
  "nnoremap \l  <Cmd>Bufselect<CR>
  nnoremap \l  <Cmd>BufExplorer<CR>
  nnoremap \r  <Cmd>Oldfiles! COMMIT_EDITMSG<CR>
else
  nnoremap -   <Cmd>Explore<CR>
  nnoremap \l  <Cmd>buffers<CR>
  nnoremap \r  <Cmd>browse oldfiles<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
""" visual mode mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-a> 0
vnoremap <C-e> $
vnoremap \0  "0y
vnoremap \[  <Cmd>call ClipboardToggle()<CR>
vnoremap \]  <Cmd>call MouseToggle()<CR>
vnoremap \a  0
vnoremap \e  $
vnoremap \v  "0p
vnoremap \y  "+y
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
