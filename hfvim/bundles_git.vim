let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'git')
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundleLazy 'tpope/vim-fugitive', {
        \ 'augroup': 'fugitive',
        \ 'autoload': {
        \   'commands': ['Git', 'Gcd', 'Glcd', 'Gstatus', 'Gcommit',
        \                'Ggrep', 'Glgrep', 'Glog', 'Gllog', 'Gedit',
        \                'Gsplit', 'Gvsplit', 'Gtabedit', 'Gpedit',
        \                'Gread', 'Gwrite', 'Gwq', 'Gdiff', 'Gsdiff',
        \                'Gvdiff', 'Gmove', 'Gremove', 'Gblame', 'Gbrowse']}
        \ }

    if neobundle#tap('vim-gitgutter')
        " gitgutter conflicts with YouCompleteMe
        " May need to add other filetypes here that also use YCM
        " au BufEnter * if &filetype != "cpp" | exec "GitGutterEnable" | endif
        " au BufEnter * if &filetype == "cpp" | exec "GitGutterDisable" | endif
        call neobundle#untap()
    endif

    if neobundle#tap('vim-fugitive')
        function! neobundle#tapped.hooks.on_post_source(bundle)
            doautoall fugitive BufNewFile
        endfunction

        " Unite Menu for Git Command
        let g:unite_source_menu_menus.git = {
        \ 'description' : '             Common Git Commands
            \                            ⌘ [menu]g',
        \}
        let g:unite_source_menu_menus.git.command_candidates = [
            \['▷ git status       (Fugitive)                                ⌘ ,gs',
                \'Gstatus'],
            \['▷ git diff         (Fugitive)                                ⌘ ,gd',
                \'Gdiff'],
            \['▷ git commit       (Fugitive)                                ⌘ ,gc',
                \'Gcommit'],
            \['▷ git blame        (Fugitive)                                ⌘ ,gb',
                \'Gblame'],
            \['▷ git stage        (Fugitive)                                ⌘ ,gw',
                \'Gwrite'],
            \['▷ git checkout     (Fugitive)                                ⌘ ,go',
                \'Gread'],
            \['▷ git rm           (Fugitive)                                ⌘ ,gr',
                \'Gremove'],
            \['▷ git mv           (Fugitive)                                ⌘ ,gm',
                \'exe "Gmove " input("destination: ")'],
            \['▷ git push         (Fugitive)                                ⌘ ,gp',
                \'Git push'],
            \['▷ git pull         (Fugitive)                                ⌘ ,gP',
                \'Git pull'],
            \['▷ git prompt       (Fugitive)                                ⌘ ,gi',
                \'exe "Git! " input("command git: ")'],
            \['▷ git cd           (Fugitive)',
                \'Gcd'],
            \]
        nnoremap <silent>[menu]g :Unite -start-insert menu:git<CR>

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

        call neobundle#untap()
    endif
endif
