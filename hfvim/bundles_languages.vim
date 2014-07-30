let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'cpp')
    NeoBundleLazy 'vim-scripts/a.vim', {'autoload' : {'filetypes' : ['cpp']}} " {{{
    NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {'autoload' : {'filetypes' : ['cpp']}}
endif

if count(s:settings.bundle_groups, 'actionscript')
    NeoBundleLazy 'jeroenbourgois/vim-actionscript', {'autoload' : {'filetypes' : ['actionscript']}} " {{{
    
endif

if count(s:settings.bundle_groups, 'haxe')
    NeoBundleLazy 'jdonaldson/vaxe', {'autoload' : {'filetypes' : ['haxe']}} " {{{
        set autowrite
endif

if count(s:settings.bundle_groups, 'javascript')
    NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload' : {'filetypes' : ['javascript']}} " {{{
endif

if count(s:settings.bundle_groups, 'python')

endif
