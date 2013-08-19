" vim:fdm=marker

" Pathogen {{{
call pathogen#infect("~/.vim/bundle")
call pathogen#helptags()
" }}}

" Editor {{{

" disable vi compatibility (emulation of old bugs)
set nocompatible

if has("autocmd")
    filetype plugin indent on
endif

" Encoding {{{
" set UTF8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" }}}

" Tabs {{{
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set softtabstop=4
" }}}

" Color Schemes {{{
" turn syntax highlighting on
set t_Co=256
syntax on
set guifont=Inconsolata\ Medium\ 10

"colorscheme slate
"colorscheme slate2
"colorscheme BusyBee
"colorscheme darkrobot
"colorscheme jellybeans
"colorscheme kib_darktango
"colorscheme native
"colorscheme no_quater
"colorscheme paintbox
"colorscheme refactor
"colorscheme symfony
"colorscheme two2tango
colorscheme wombat256
" }}}

" Misc {{{
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" }}}

" Insert Mode {{{

" Allow backspace to always delete to left of cursor.
set backspace=2
set backspace=indent,eol,start

" Exit Insert Mode
:imap jj <Esc>

" }}}

" Shortcuts {{{



" }}}
" }}}

" Powerline {{{

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" }}}
