nmap ; [altlead]
vmap ; [altlead]

" Leave insert mode
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>

" Change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>

" Pulse cursor line to help locate cursor
nnoremap <silent> <C-p> :Pulse<cr>
inoremap <silent> <C-p> <esc>:Pulse<cr>aj

" Auto center {{{
    nnoremap <silent> n nzz
    nnoremap <silent> N Nzz
    " make * stay on current word
    nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
    nnoremap <silent> # #zz:PulseIfEnabled<cr>
    nnoremap <silent> g* g*zz:PulseIfEnabled<cr>
    nnoremap <silent> g# g#zz:PulseIfEnabled<cr>
    nnoremap <silent> <C-o> <C-o>zz:PulseIfEnabled<cr>
    nnoremap <silent> <C-i> <C-i>zz:PulseIfEnabled<cr>
" }}}

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

" Easier to type and I don't use the default behaivour
noremap H ^
noremap L $
vnoremap L g_

" clear highlight
noremap <silent> <cr> :noh<cr>:call clearmatches()<cr>
nnoremap <leader><cr> :set hlsearch! hlsearch?<cr>

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

" Source
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" File Navigation {{{
   nnoremap <C-s> :bp<cr>
   nnoremap <C-d> :bn<cr>
" }}}
" Highlight Word {{{
    " highlighting words temporarily similar to *.
    " Thanks Steve Losh
    nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
    nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
    nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
    nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
    nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
    nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

    hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
    hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
    hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
    hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
    hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
    hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
" }}}
