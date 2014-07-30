let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'shell')
    NeoBundleLazy 'Shougo/vimshell', {
        \ 'autoload' : { 'commands' : [ 'VimShell', "VimShellPop", "VimShellInteractive" ] }
        \ }
endif
