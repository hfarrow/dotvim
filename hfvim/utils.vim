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
