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

if count(s:settings.bundle_groups, 'rust')
    NeoBundleLazy 'rust-lang/rust.vim', {'autoload' : {'filetypes' : ['rust']}}
    NeoBundle 'phildawes/racer', {
                \   'build' : {
                \     'mac': 'cargo build --release',
                \     'unix': 'cargo build --release',
                \   }
                \ }

    if neobundle#tap('racer')
        function! neobundle#hooks.on_source(bundle)
        endfunction

        let g:racer_cmd = '~/.vim/bundle/racer/target/release/racer'
        let $RUST_SRC_PATH = '/Library/Caches/Homebrew/rust--git/src'

        call neobundle#untap()
    endif
endif

if count(s:settings.bundle_groups, "cs")
        NeoBundleLazy 'OmniSharp/omnisharp-vim', {'autoload' : {'filetypes' : ['cs']}}

        let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

        " If you are using the omnisharp-roslyn backend, use the following
        " let g:syntastic_cs_checkers = ['code_checker']
        augroup omnisharp_commands
            autocmd!

            "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
            " autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

            " Synchronous build (blocks Vim)
            "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
            " Builds can also run asynchronously with vim-dispatch installed
            autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
            " automatic syntax check on events (TextChanged requires Vim 7.4)
            autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

            " Automatically add new cs files to the nearest project on save
            autocmd BufWritePost *.cs call OmniSharp#AddToProject()

            "show type information automatically when the cursor stops moving
            autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

            "The following commands are contextual, based on the current cursor position.

            autocmd FileType cs nnoremap [altlead]gd :OmniSharpGotoDefinition<cr>
            autocmd FileType cs nnoremap [altlead]fi :OmniSharpFindImplementations<cr>
            autocmd FileType cs nnoremap [altlead]ft :OmniSharpFindType<cr>
            autocmd FileType cs nnoremap [altlead]fs :OmniSharpFindSymbol<cr>
            autocmd FileType cs nnoremap [altlead]fu :OmniSharpFindUsages<cr>
            "finds members in the current buffer
            autocmd FileType cs nnoremap [altlead]fm :OmniSharpFindMembers<cr>
            " cursor can be anywhere on the line containing an issue
            autocmd FileType cs nnoremap [altlead]x  :OmniSharpFixIssue<cr>
            autocmd FileType cs nnoremap [altlead]fx :OmniSharpFixUsings<cr>
            autocmd FileType cs nnoremap [altlead]tt :OmniSharpTypeLookup<cr>
            autocmd FileType cs nnoremap [altlead]dc :OmniSharpDocumentation<cr>
            "navigate up by method/property/field
            autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
            "navigate down by method/property/field
            autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

        augroup END

        " Contextual code actions (requires CtrlP or unite.vim)
        nnoremap [altlead]<space> :OmniSharpGetCodeActions<cr>
        " Run code actions with text selected in visual mode to extract method
        vnoremap [altlead]<space> :call OmniSharp#GetCodeActions('visual')<cr>

        " rename with dialog
        nnoremap [altlead]r :OmniSharpRename<cr>
        " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
        command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

        " Force OmniSharp to reload the solution. Useful when switching branches etc.
        nnoremap [altlead]q :OmniSharpReloadSolution<cr>
        nnoremap [altlead]f :OmniSharpCodeFormat<cr>
        " Load the current .cs file to the nearest project
        nnoremap [altlead]a :OmniSharpAddToProject<cr>

        " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
        nnoremap [altlead]ss :OmniSharpStartServer<cr>
        nnoremap [altlead]sp :OmniSharpStopServer<cr>

        " Add syntax highlighting for types and interfaces
        nnoremap [altlead]h :OmniSharpHighlightTypes<cr>
endif
