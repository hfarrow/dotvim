let s:settings = g:hfvim.settings

function! Debug(msg)
    if s:settings.debug == 1
        echom "[debug]" a:msg
    endif
endfunction

function! Source(file)
    call Debug('Sourcing: ' . s:settings.dotvim_path . "/" . a:file)
    exec ":source " . s:settings.dotvim_path . "/" . a:file
endfunction

function! EnsureExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction

function! CloseWindowOrKillBuffer()
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

    " never bdelete a nerd tree
    if matchstr(expand("%"), 'NERD') == 'NERD'
        wincmd c
        return
    endif

    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction
