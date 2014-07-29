let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'misc')
    NeoBundleLazy 'vim-scripts/taglist.vim', {
        \ 'commands' : ['TlistToggle']
        \ }

    if neobundle#tap('taglist.vim')
        let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'
        let tlist_lua_settings = 'lua;c:constant;C:command;t:trigger;f:function'
        let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;' .
                               \ 'c:class;g:enum;s:struct;u:union;f:function;p:prototype'
        let tlist_c_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;' .
                                   \ 'v:variable;f:function;p:prototype'
        let Tlist_Use_Right_Window = 1
        let Tlist_Show_One_File = 1
        let Tlist_Display_Tag_Scope = 1
        let Tlist_Enable_Fold_Column = 0

        map <leader>l :TlistToggle<CR>
        
        call neobundle#untap()
    endif

endif
