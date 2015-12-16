let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'editing')
    NeoBundle 'Raimondi/delimitMate'
       "let delimitMate_autoclose = 0
       let delimitMate_expand_cr = 1
    NeoBundleLazy 'vim-scripts/tComment',
    \   {'autoload' : {'mappings': ['gc']}}
    NeoBundleLazy 'Lokaltog/vim-easymotion',
    \   { 'autoload' : { 'mappings' : ',,' }}
endif
