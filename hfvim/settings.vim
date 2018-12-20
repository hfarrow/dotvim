let s:settings = g:hfvim.settings

" Color Schemes {{{
    " turn syntax highlighting on
    "if has('gui_running')
        set t_Co=256
        syntax on
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Bold\ 9
        "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Bold\ 9.5

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

        colorscheme wombat256 " {{{
            " make non text characters (line breaks) less noticable
            hi clear NonText
            hi link NonText Normal
            "make wombat256 play nice with gitgutter
            hi clear SignColumn
            "make ColorColumn same as CursorLine
            hi ColorColumn term=underline guibg=#32322e ctermbg=235
        " }}}
    "endif
" }}}
" Encoding {{{
    " set UTF8 encoding
    set enc=utf-8
    set fenc=utf-8
    set termencoding=utf-8
" }}}
" Insert Mode {{{
    " Allow backspace to always delete to left of cursor.
    set backspace=indent,eol,start
" }}}
" Searching {{{
    set hlsearch                            "Highlight searches
    set incsearch                           "incremental searchinet
    set ignorecase                          "ignore case for searching
"    set smartcase                           "do case-sensitive if there's a capital letter
" }}}
" Folding {{{
    set foldlevelstart=99

    " "Focus" the current line.  Basically:
    "
    " 1. Close all folds.
    " 2. Open just the folds containing the current line.
    " 3. Move the line to a little bit (15 lines) above the center of the screen.
    " 4. Pulse the cursor line.  My eyes are bad.
    "
    " This mapping wipes out the z mark, which I never use.
    "
    " I use :sus for the rare times I want to actually background Vim.
    nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>
    nnoremap <leader>z zR
    nnoremap <leader>Z zM

    function! MyFoldText() " {{{
        let line = getline(v:foldstart)

        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        " expand tabs into spaces
        let onetab = strpart('          ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')

        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction " }}}
    set foldtext=MyFoldText()
" }}}
" Misc {{{
    set number                              "line numbers
    set showmatch                           "highlight matching braces
    set comments=sl:/*,mb:\ *,elx:\ */      "intelligent comments
    set textwidth=112                       "wrap lines
    set formatoptions=qrn1j
    set mouse=a                             "enable mouse
    set history=1000                        "number of command lines to remember
    set ttyfast                             "assume fast terminal connection
    set updatetime=1000                      "not recommended to be below 1000 due to glitches in terminal
    set list
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
    set hidden
    set showmode
    set showcmd
    set visualbell
    set lazyredraw
    set matchtime=3
    set showbreak=↪
    set splitbelow
    set splitright
    set autowrite
    set autoread
    set shiftround
    set title
    set linebreak
    set colorcolumn=+1
    set synmaxcol=800                       "Don't try to highlight lines longer than 800 characters.
    set backupskip=/tmp/*,/private/tmp/*"   "Make Vim able to edit crontab files again.
    set cmdheight=2                         "Remove 'Press Enter to continue' message when type information is longer than one line."

    " Time out on key codes but not mappings.
    set notimeout
    set ttimeout
    set ttimeoutlen=10
    "cancel out of a mapping and re-enter insert mode. ie: j<C-d>j to insert 'jj'
    inoremap <C-d> <esc>a
" }}}
" Tabs {{{
    set autoindent                          "use indentation of previous line"
    set smartindent                         "use intelligent indentation

    " configure tabwidth and insert spaces instead of tabs
    set tabstop=4                           "tab width is 4 spaces
    set shiftwidth=4                        "indent also with 4 spaces
    set expandtab                           "expand tabs to spaces
    set softtabstop=4
" }}}
" Tags {{{
    set showfulltag                         "show entire tag when completing from tags
    exec 'set tags+=' . MakePath('dependencies/tags/cpp')
    exec 'set tags+=' . MakePath('dependencies/tags/sdl2')
" }}}
" Spelling {{{
    exec 'set spellfile+=' . MakePath('dependencies/spelling/custom-dictionary.utf-8.add')
    exec 'set spellfile+=' . '~/.vim-local-dictionary.utf-8.add'
    call EnsureExists(MakePath('dependencies/spelling//'))
    nnoremap zG 2zg
" }}}
" vim file/folder management {{{
    " persistent viminfo
    if has('viminfo')
        set vi^=!
    endif

    " persistent undo
    if exists('+undofile')
        set undofile
        exec ':set undodir=' . MakePath('.cache/undo//')
    endif

    " backups
    set backup
    exec ':set backupdir=' . MakePath('.cache/backup//')

    " swap files
    exec 'set directory=' . MakePath('.cache/swap//')
    set noswapfile

    call EnsureExists(&undodir)
    call EnsureExists(&backupdir)
    call EnsureExists(&directory)
" }}}
" auto groups {{{
    " Do not show trailing whtite space in insert mode.
    augroup trailing
        au!
        au InsertEnter * :set listchars-=trail:⌴
        au InsertLeave * :set listchars+=trail:⌴
    augroup END

    " Only show cursorline in the current window and in normal mode.
    augroup cline
        au!
        au WinLeave,InsertEnter * set nocursorline
        au WinEnter,InsertLeave * set cursorline
    augroup END

    " Make sure Vim returns to the same line when you reopen a file.
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
    augroup END

    " Save when losing focus
    au FocusLost * :silent! wall

    " Resize splits when the window is resized
    au VimResized * :wincmd =
"}}}
