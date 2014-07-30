let s:settings = g:hfvim.settings
let s:dotvim_path = s:settings.dotvim_path

" Editor {{{
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
        colorscheme wombat256
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
    set backspace=2
    set backspace=indent,eol,start

" }}}

" Searching {{{
    set hlsearch                            "Highlight searches
    set incsearch                           "incremental searching
    set ignorecase                          "ignore case for searching
    set smartcase                           "do case-sensitive if there's a capital letter
" }}}

" Misc {{{
    set number                              "line numbers
    set showmatch                           "highlight matching braces
    set comments=sl:/*,mb:\ *,elx:\ */      "intelligent comments
    "set textwidth=160                       "wrap lines at 120 chars. 
    set mouse=a                             "enable mouse
    set history=1000                        "number of command lines to remember
    set ttyfast                             "assume fast terminal connection
    "set showcmd                             "show information in last line of editor
    "set foldenable                          "enable folds by default
    "set foldmethod=syntax                   "fold via syntax of files
    "set foldlevelstart=99                   "open all folds by default
    set nofoldenable
    "let g:xml_syntax_folding=1              "enable xml folding
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
    exec 'set tags+=' . s:dotvim_path . '/dependencies/tags/cpp'
    exec 'set tags+=' . s:dotvim_path . '/dependencies/tags/sdl2'
" }}}

" vim file/folder management {{{
    " persistent viminfo
    if has('viminfo')
        set vi^=!
    endif
    
    " persistent undo
    if exists('+undofile')
        set undofile
        exec ':set undodir=' . s:dotvim_path . '/.cache/undo'
    endif

    " backups
    set backup
    exec ':set backupdir=' . s:dotvim_path . '/.cache/backup'

    " swap files
    exec 'set directory=' . s:dotvim_path . '/.cache/swap'
    set noswapfile

    call EnsureExists(&undodir)
    call EnsureExists(&backupdir)
    call EnsureExists(&directory)
" }}}
