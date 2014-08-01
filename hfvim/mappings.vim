" Leave insert mode
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>

" Change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>

" Auto center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" reselect last paste
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" shortcuts for windows
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" clear highlight
nnoremap <cr> :set hlsearch! hlsearch?<cr>

" S = Stamp replace word with last yanked text
nnoremap S diw"0P

" copy / paste from clipboard
vnoremap <C-c> "+y
nnoremap <C-x> "+gP

" Replace Word Under Cursor
nnoremap <space>c :%s/<C-r><C-w>//g<Left><Left>
" Replace selected text in all files
vnoremap <space>a "hy:!ack -l '<C-r>h' \| xargs perl -pi -E 's/<C-r>h/<C-r>h/g'<Left><Left><Left>

" make Y consistent with C and D. See :help Y.
nnoremap Y y$

" Alt-j insert line below, Alt-k insert line above
" Alt-J delete line below, Alt-K delte live above
nnoremap <silent><A-J> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-K> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Window killer
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

" Neobundle Upddate
nnoremap <leader>nbu :Unite neobundle/update -vertical -no-start-insert<cr>

" Generate ctags
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG
