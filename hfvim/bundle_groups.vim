let s:settings = g:hfvim.settings

let s:settings.bundle_groups = []
call add(s:settings.bundle_groups, 'core')
call add(s:settings.bundle_groups, 'unite')
call add(s:settings.bundle_groups, 'editing')
call add(s:settings.bundle_groups, 'autocomplete')
call add(s:settings.bundle_groups, 'shell')
call add(s:settings.bundle_groups, 'git')
call add(s:settings.bundle_groups, 'misc')
call add(s:settings.bundle_groups, 'cpp')
call add(s:settings.bundle_groups, 'actionscript')
call add(s:settings.bundle_groups, 'haxe')
call add(s:settings.bundle_groups, 'javascript')
call add(s:settings.bundle_groups, 'python')
call add(s:settings.bundle_groups, 'rust')
call add(s:settings.bundle_groups, "cs")

let s:settings.gui_bundles = []

" exclude all language-specific bundles by default
if !exists('g:hfvim_settings.bundle_groups_excluded')
    let g:hfvim_settings.bundle_groups_excluded = ['cpp', 'actionscript', 'haxe', 'javascript', 'python']
endif

for group in g:hfvim_settings.bundle_groups_excluded
    let i = index(s:settings.bundle_groups, group)
    if i != -1
        call remove(s:settings.bundle_groups, i)
    endif
endfor

if exists('g:hfvim_settings.bundle_groups_included')
    for group in g:hfvim_settings.bundle_groups_included
        call add(s:settings.bundle_groups, group)
    endfor
endif

if exists('g:hfvim_settings.disable_all_bundles') && g:hfvim_settings.disable_all_bundles == 1
    let s:settings.bundle_groups = []
endif

if s:settings.debug == 1
    if exists('g:hfvim_settings.disable_all_bundles') && g:hfvim_settings.disable_all_bundles == 1
        call Debug('hfvim disable all bundles is true')
    else
        call Debug('hfvim included bundle groups: ' . join(s:settings.bundle_groups, ','))
    endif
endif
