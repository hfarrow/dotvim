" vim:fdm=marker

" Edit this file
map <Leader>te :e ~/.vimrc<CR>

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

" Tags {{{

set tags+=~/.vim/tags/cpp
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" TODO: Add tags for OpenGL, SDL, etc

" }}}

" Powerline {{{

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" }}}

" Nerdtree {{{

map <Leader>nt :NERDTreeToggle<CR>

" }}}

" Unite {{{

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
    let g:unite_source_grep_recursive_opt=''
endif

nmap <Space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
nnoremap <silent> [unite]r :<C-u>Unite -toggle -auto-resize -buffer-name=files file_mru<cr><c-u>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

" }}}
