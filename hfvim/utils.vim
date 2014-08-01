let s:settings = g:hfvim.settings

function! Debug(msg)  " {{{
    if s:settings.debug == 1
        echom "[debug]" a:msg
    endif
endfunction " }}}

function! Source(file) " {{{
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
endfunction " }}}

function! MakePath(path) " {{{
    if match(a:path, '/') == 0
        string.sub(a:path, 1)
    endif
    let ret = s:settings.dotvim_path . a:path
    return ret
endfunction " }}}

function! EnsureExists(path) " {{{
    call Debug('Ensure directory exists: ' . expand(a:path))
    if filereadable(expand(a:path))
        call Debug('Cannot ensure directory "' . expand(a:path) . '" exists becuase it is a file.')
    elseif !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction " }}}

function! CloseWindowOrKillBuffer() " {{{
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
endfunction " }}}

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Pulse Line {{{
    let s:settings.pulseEnabled = 0
    function! s:PulseIfEnabled() " {{{
        if s:settings.pulseEnabled == 1
            Pulse
        endif
    endfunction " }}}

    function! s:Pulse() " {{{
        redir => old_hi
            silent execute 'hi CursorLine'
        redir END
        let old_hi = split(old_hi, '\n')[0]
        let old_hi = substitute(old_hi, 'xxx', '', '')

        if has('gui_running')
            let pulseColorList = [ '#2a2a2a', '#333333', '#3a3a3a', '#444444', '#4a4a4a' ]
            let pulseColorattr = 'guibg'
            for pulse in pulseColorList
                execute 'hi CursorLine guibg=' . pulse
                redraw
                sleep 6m
            endfor
            for pulse in reverse(copy(pulseColorList))
                execute 'hi CursorLine guibg=' . pulse
                redraw
                sleep 6m
            endfor
        else
            let steps = 8
            let width = 1
            let start = width
            let end = steps * width
            let color = 233

            for i in range(start, end, width)
                execute "hi CursorLine ctermbg=" . (color + i)
                redraw
                sleep 4m
            endfor
            for i in range(end, start, -1 * width)
                execute "hi CursorLine ctermbg=" . (color + i)
                redraw
                sleep 4m
            endfor
        endif

        execute 'hi ' . old_hi

    endfunction " }}}
    command! -nargs=0 Pulse call s:Pulse()
    command! -nargs=0 PulseIfEnabled call s:PulseIfEnabled()
" }}}
