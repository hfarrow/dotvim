let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'shell')
    NeoBundleLazy 'Shougo/vimshell', {
        \ 'autoload' : { 'commands' : [ 'VimShell', "VimShellPop", "VimShellInteractive" ] }
        \ }


    if neobundle#tap('vimshell')
        function! neobundle#hooks.on_source(bundle)
        endfunction

        nnoremap <silent> [unite]x :VimShellPop<cr>

        call neobundle#untap()
    endif
endif
