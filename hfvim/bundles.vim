let s:settings = g:hfvim.settings

" Neobundle Config {{{
if has('vim_starting')
    exec 'set runtimepath+=' . s:settings.dotvim_path . '/bundle/neobundle.vim/'
endif

" Use git protocol.
" let g:neobundle#types#git#default_protocol = 'git'

call neobundle#begin(expand( s:settings.dotvim_path . '/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

call Source('hfvim/bundles_core.vim')
call Source('hfvim/bundles_git.vim')

call neobundle#end()

filetype plugin indent on

if exists('g:hf_settings.disabled_bundles')
    for bundle in g:hfvim_settings.disabled_bundles
        exec 'NeoBundleDisable '.bundle
    endfor
endif

" Installation Check
NeoBundleCheck

if !has('vim_starting')
    " Call on_source hook when reloading .vimrc
    call neobundle#call_hook('on_source')
endif
"}}}

