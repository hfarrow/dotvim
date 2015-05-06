if exists('b:loaded_ftplug_vimfiler_vim')
    finish
endif
let b:loaded_ftplug_vimfiler_vim = 1

" nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_edit_file)
nmap <buffer> <RightMouse> <Plug>(vimfiler_edit_file)
vmap <buffer> s <Plug>(vimfiler_toggle_mark_selected_lines)
nmap <buffer> s <Plug>(vimfiler_toggle_mark_current_line)
nmap <buffer> S <Plug>(vimfiler_toggle_mark_current_line_up)
nmap <buffer> <C>s <Plug>(vimfiler_select_sort_type)
