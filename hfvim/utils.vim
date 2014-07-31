let s:settings = g:hfvim.settings  

function! Debug(msg)
    if s:settings.debug == 1
        echom "[debug]" a:msg
    endif
endfunction

function! Source(file)
    let expandedFile = expand(a:file)
    if filereadable(expandedFile)
        call Debug('Sourcing :source ' . a:file . ' (' . expandedFile . ')')
        exec ':source ' . expandedFile
    else
        let path = expand(MakePath(a:file))
        if filereadable(path)
            call Debug('Sourcing :source ' . a:file . ' (' . path . ')')
            exec ':source ' . path
        else
            call Debug('Sourcing :runtime ' . a:file . ' (' . a:file . ')')
            exec ':runtime ' . a:file
        endif
    endif
endfunction

function! MakePath(path)
    if match(a:path, '/') == 0
        string.sub(a:path, 1)
    endif
    let ret = s:settings.dotvim_path . a:path
    return ret
endfunction

function! EnsureExists(path)
    call Debug('Ensure directory exists: ' . expand(a:path))
    if filereadable(expand(a:path))
        call Debug('Cannot ensure directory "' . expand(a:path) . '" exists becuase it is a file.')
    elseif !isdirectory(expand(a:path))
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
