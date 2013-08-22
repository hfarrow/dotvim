" vim:fdm=marker

" Edit this file
map <Leader>te :e ~/.vimrc<CR>

" Pathogen {{{
call pathogen#infect("~/.vim/bundle")
call pathogen#infect("~/.vim/custom_bundle")
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
"set autoindent
" use intelligent indentation for C
"set smartindent
" configure tabwidth and insert spaces instead of tabs
"set tabstop=4        " tab width is 4 spaces
"set shiftwidth=4     " indent also with 4 spaces
"set expandtab        " expand tabs to spaces
"set softtabstop=4

set tabstop=4
set shiftwidth=4
set autoindent

" }}}

" Color Schemes and Font {{{
" turn syntax highlighting on
set t_Co=256
syntax on
set guifont=Inconsolata\ for\ Powerline:h14

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
colorscheme wombat256mod
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

" Window keybings
map <C-h> <C-W>h
map <C-j> <C-W>b
map <C-k> <C-W>t
map <C-l> <C-W>l

" Conversions
map <Leader>cu :e ++ff=mac<CR> :set ff=unix<CR> :w<CR>
map <Leader>cm :e ++ff=unix<CR> :set ff=mac<CR> :w<CR>
map <Leader>cd :e ++ff=dos<CR> :set ff=unix<CR> :w<CR>

" close
map <Leader>cc :close<CR>

" S = Stamp replace word with last yanked text
nnoremap S diw"0P

" }}}
" }}}

" Find and Replace {{{

" Replace Word Under Cursor
noremap <Leader>vr :%s/\<<C-r><C-w>\>//g<Left><Left>
" Replace selected text in all files
noremap <Leader>var "hy:!ack -l '<C-r>h' \| xargs perl -pi -E 's/<C-r>h/<C-r>h/g'<Left><Left><Left><Left>

" }}}

" Tags and TagList {{{
"
set tags+=~/.vim/tags/cpp

let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Display_Tag_Scope = 1

map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <Leader>l :TlistToggle<CR>

" TODO: Add tags for OpenGL, SDL, etc

" }}}

" Powerline {{{

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" }}}

" Nerdtree {{{

let g:NERDChristmasTree = 1
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>

" }}}

" Unite {{{

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')

let g:unite_data_directory='~/.vim/.cache/unite'
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=50000
let g:unite_prompt='» '

let g:unite_source_grep_max_candidates=500
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

nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -start-insert -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -start-insert -buffer-name=files file_rec/async<cr><c-u>
nnoremap <silent> [unite]e :<C-u>Unite -toggle -start-insert -buffer-name=mru file_mru<cr><c-u>
nnoremap <silent> [unite]r :<C-u>Unite -toggle -buffer-name=mru file_mru<cr><c-u>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

map <C-F11> <Plug>(unite_redraw)

" }}}

" Fugitive (Git) {{{

map <Leader>gd :Gdiff<CR>
map <Leader>gq :diffoff!<CR> <C-h> :close<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gl :Glog<CR>
map <Leader>gg :Git checkout<CR>
map <Leader>gt :Git stash apply stash^{/console}<CR>
map <Leader>gvr :Git svn rebase<CR>
map <Leader>gvc :Git svn dcommit<CR>
map <Leader>gk :Git checkout .
map <Leader>gve :Git stash<CR> :Git svn rebase<CR> :Git stash pop<CR>

" }}}

" SnipMate {{{

"call ExtractSnipsFile('~/.vim/custom_bundle/actionscript/snippets', 'actionscript')

" }}}"
