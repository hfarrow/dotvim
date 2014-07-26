let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'core')
    NeoBundle 'Shougo/neobundle-vim-recipes'
    NeoBundle 'Shougo/vimproc.vim', {
    \   'build' : {
    \       'windows' : 'make -f make_mingw32.mak',
    \       'cygwin' : 'make -f make_cygwin.mak',
    \       'mac' : 'make -f make_mac.mak',
    \       'unix' : 'make -f make_unix.mak',
    \   },
    \}
    NeoBundle 'flazz/vim-colorschemes'
    NeoBundle "MarcWeber/vim-addon-mw-utils"
    NeoBundle "tomtom/tlib_vim",
    NeoBundle "vim-scripts/L9"
    NeoBundle 'vim-scripts/localvimrc'
        let g:localvimrc_sandbox = 0
        let g:localvimrc_persistent = 1
        let g:localvimrc_name = ".lvimrc"
    NeoBundle 'bling/vim-airline'
        let g:airline_powerline_fonts=1
        set laststatus=2
    NeoBundle 'Lokaltog/powerline'
endif
