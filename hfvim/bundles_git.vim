let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'git')
    NeoBundleLazy 'tpope/vim-fugitive', {
        \ 'augroup': 'fugitive',
        \ 'autoload': {
        \   'commands': ['Git', 'Gcd', 'Glcd', 'Gstatus', 'Gcommit',
        \                'Ggrep', 'Glgrep', 'Glog', 'Gllog', 'Gedit',
        \                'Gsplit', 'Gvsplit', 'Gtabedit', 'Gpedit',
        \                'Gread', 'Gwrite', 'Gwq', 'Gdiff', 'Gsdiff',
        \                'Gvdiff', 'Gmove', 'Gremove', 'Gblame', 'Gbrowse']}
        \ }

    if neobundle#tap('vim-fugitive') "{{{
        function! neobundle#tapped.hooks.on_post_source(bundle)
            doautoall fugitive BufNewFile
        endfunction
        call neobundle#untap()
    endif

    map <Leader>gd :Gdiff<cr>
    map <Leader>gq :diffoff!<cr> <C-h> :close<cr>
    map <Leader>gs :Gstatus<cr>
    map <Leader>gc :Gcommit<cr>
    map <Leader>gb :Gblame<cr>
    map <Leader>gl :Glog<cr>
    map <Leader>gg :Git checkout<cr>
    map <Leader>gvr :Git svn rebase<cr>
    map <Leader>gvc :Git svn dcommit<cr>
    map <Leader>gk :Git checkout .
endif
