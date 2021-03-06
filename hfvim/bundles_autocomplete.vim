let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'autocomplete')
    NeoBundle 'SirVer/ultisnips'
        " Snippets are separated from the engine. Add this if you want them:
        NeoBundle 'honza/vim-snippets'
        let g:UltiSnipsExpandTrigger="<c-a>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'Valloric/YouCompleteMe'
        " TODO: recursive init sumodule and --omnisharp-completer
        " \ {'build' :
        " \   {
        " \       'unix' : './install.sh --clang-completer',
        " \       'mac' : './install.sh --clang-completer',
        " \       'cygwin' : './install.sh --clang-completer',
        " \       'windows' : './install.sh --clang-completer'
        " \   }
        " \ }

        nnoremap [altlead]je :YcmCompleter GoToDefinitionElseDeclaration<CR>
        nnoremap [altlead]jd :YcmCompleter GoToDefinition<CR>
        nnoremap [altlead]jD :YcmCompleter GoToDeclaration<CR>
        nnoremap [altlead]d :YcmDiags<CR>
        nnoremap [altlead]D :YcmShowDetailedDiagnostic<CR>
        " If you prefer the Omni-Completion tip window to close when a selection is
        " made, these lines close it on movement in insert mode or when leaving
        " insert mode
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

endif
