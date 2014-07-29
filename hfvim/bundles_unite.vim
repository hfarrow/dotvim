let s:settings = g:hfvim.settings

if count(s:settings.bundle_groups, 'unite')
    NeoBundleLazy 'Shougo/unite.vim', {
        \ 'commands' : ['Unite', 'UniteWithCursorWord', 'UniteWithInput']
        \ }
    NeoBundleLazy 'Shougo/unite-help', {'depends' : 'Shougo/unite.vim', 'on_source' : 'unite.vim'}
    NeoBundleLazy 'Shougo/neomru.vim', {'depends' : 'Shougo/unite.vim', 'on_source' : 'unite.vim'}
    NeoBundleLazy 'Shougo/unite-session', {'depends' : 'Shougo/unite.vim', 'on_source' : 'unite.vim'}
    NeoBundleLazy 'Shougo/vimfiler.vim', {
        \ 'depends' : 'Shougo/unite.vim',
        \ 'commands' : [
        \         { 'name' : 'VimFiler',
        \           'complete' : 'customlist,vimfiler#complete' },
        \         { 'name' : 'VimFilerTab',
        \           'complete' : 'customlist,vimfiler#complete' },
        \         { 'name' : 'VimFilerExplorer',
        \           'complete' : 'customlist,vimfiler#complete' },
        \         { 'name' : 'Edit',
        \           'complete' : 'customlist,vimfiler#complete' },
        \         { 'name' : 'Write',
        \           'complete' : 'customlist,vimfiler#complete' },
        \         'Read', 'Source'],
        \ 'mappings' : '<Plug>(vimfiler_',
        \ 'explorer' : 1,
        \ }
    NeoBundleLazy 'Shougo/unite-outline'

    if neobundle#tap('unite.vim')
        function! neobundle#hooks.on_source(bundle)
            call EnsureExists(s:settings.dotvim_path . '/.cache/unite')
            call unite#filters#matcher_default#use(['matcher_fuzzy'])
            call unite#filters#sorter_default#use(['sorter_rank'])
            call unite#set_profile('files', 'smartcase', 1)
            call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')

            let g:unite_data_directory='~/.vim/.cache/unite'
            "let g:unite_enable_start_insert=1
            let g:unite_source_history_yank_enable=1
            let g:unite_source_rec_max_cache_files=50000
            let g:unite_source_find_max_candidates=20000
            let g:unite_source_grep_max_candidates=20000
            let g:unite_prompt='» '

            if executable('ag')
                let g:unite_source_grep_command='ag'
                let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C0'
                let g:unite_source_grep_recursive_opt=''
            elseif executable('ack')
                let g:unite_source_grep_command='ack'
                let g:unite_source_grep_default_opts='--no-heading --no-color -k -C0'
                let g:unite_source_grep_recursive_opt=''
            endif
        endfunction

        nmap <space> [unite]
        nnoremap [unite] <nop>

        nnoremap <silent> [unite]u :<C-u>Unite -toggle -start-insert<cr><c-u>
        nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
        nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
        nnoremap <silent> [unite]r :<C-u>Unite -toggle -auto-resize -buffer-name=mru file_mru<cr><c-u>
        nnoremap <silent> [unite]y :<C-u>Unite -toggle -auto-resize -buffer-name=yanks history/yank<cr>
        nnoremap <silent> [unite]l :<C-u>Unite -toggle -auto-resize -buffer-name=line line<cr>
        nnoremap <silent> [unite]b :<C-u>Unite -toggle -auto-resize -buffer-name=buffers buffer<cr>
        nnoremap <silent> [unite]/ :<C-u>Unite -toggle -auto-resize -no-quit -buffer-name=search grep:.<cr>
        nnoremap <silent> [unite]z :<C-u>Unite -toggle -auto-resize -buffer-name=mappings mapping<cr>
        nnoremap <silent> [unite]s :<C-u>Unite -toggle -auto-resize -quick-match buffer<cr>
        nnoremap <silent> [unite]m :<C-u>Unite -toggle -auto-resize -buffer-name=bookmarks bookmark<cr>
        nnoremap <silent> [unite]h :<C-u>Unite -start-insert help<CR>
        nnoremap <silent> [unite]H :<C-u><C-u>UniteWithCursorWord help<CR>
        nnoremap <silent> [unite]M :<C-u>UniteBookmarkAdd<cr><cr>
        
        " Search for word under cursor
        nmap <silent> [unite]w [unite]/<C-r><C-w><cr>

        map <C-F11> <Plug>(unite_redraw)  

        call neobundle#untap()
    endif

    if neobundle#tap('vimfiler.vim')
        nnoremap <silent> [unite]t :<C-u>VimFilerExplorer<CR>
        nnoremap <silent> [unite]T :<C-u>VimFiler<CR>
        call neobundle#untap()
    endif

    if neobundle#tap('unite-outline')
        nnoremap <silent> [unite]o :<C-u>Unite -toggle -auto-resize -buffer-name=outline outline<cr>
        call neobundle#untap()
    endif

endif
