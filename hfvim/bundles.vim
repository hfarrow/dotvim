let s:settings = g:hfvim.settings

" Neobundle Config {{{
if has('vim_starting')
    exec 'set runtimepath+=' . s:settings.dotvim_path . '/bundle/neobundle.vim/'
endif

" Use git protocol.
" let g:neobundle#types#git#default_protocol = 'git'

"=============================================================== 
" Start Bundles
"=============================================================== 
call neobundle#begin(expand( s:settings.dotvim_path . '/bundle'))
    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'

    call Source('hfvim/bundles_core.vim')
    call Source('hfvim/bundles_unite.vim')
    call Source('hfvim/bundles_editing.vim')
    call Source('hfvim/bundles_autocomplete.vim')
    call Source('hfvim/bundles_shell.vim')
    call Source('hfvim/bundles_git.vim')
    call Source('hfvim/bundles_misc.vim')
    call Source('hfvim/bundles_languages.vim')
call neobundle#end()
" End Bundles
"=============================================================== 

filetype plugin indent on

if exists('g:hfvim_settings.disabled_bundles')
    call Debug('hfvim disabled bundles: ' . join(g:hfvim_settings.disabled_bundles, ','))
    for bundle in g:hfvim_settings.disabled_bundles
        exec 'NeoBundleDisable '.bundle
    endfor
endif

if !has('gui_running')
    if exists('s:settings.gui_bundles')
    call Debug('hfvim disabled terminal bundles: ' . join(s:settings.gui_bundles, ','))
        for bundle in s:settings.gui_bundles
            exec 'NeoBundleDisable '.bundle
        endfor
    endif
endif

" Installation Check
NeoBundleCheck

if !has('vim_starting')
    " Call on_source hook when reloading .vimrc
    call neobundle#call_hook('on_source')
endif
"}}}

