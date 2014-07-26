let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'git')
    " TODO: Lazy load once you open a file from a repo?
    NeoBundle 'tpope/vim-fugitive', {'augroup' : 'fugitive'}
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
        map <Leader>gve :Git stash<cr> :Git svn rebase<cr> :Git stash pop<cr> 
endif
