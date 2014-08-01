" hfvim
" Author: Heath Farrow <heath.farrow@gmail.com>
" Source: https://github.com/hfarrow/dotvim
"
" Special thanks goes to all the great vim users from whom I have borrowed countless
" numbers of snippets, functions, and ideas.
"
" This vimrc is broken into mutliple files that are sourced. Each bundle group has its
" own file. General utility functions are in utils.vim. Settings and mapping are in their 
" respective .vim files.

set nocompatible

let g:hfvim = {}
let g:hfvim.settings = {}
let s:settings = g:hfvim.settings

let s:settings.dotvim_path = '~/.vim/'

"remap leader key
let mapleader = ','
let g:mapleader = ','

let s:settings.debug = 0

let g:hfvim.version_major = 1
let g:hfvim.version_minor = 0

if !exists('g:hfvim_settings') || !exists('g:hfvim_settings.expected_major_version')
    echom 'The g:hfvim_settings and g:hfvim_settings.expected_major_version variables must be defined.'
    finish
endif

if g:hfvim_settings.expected_major_version != g:hfvim.version_major
    echom 'The version number in your config does not match the distribution version.'
    finish
endif

" override defaults with the ones specified in g:hfvim_settings
for key in keys(s:settings)
    if has_key(g:hfvim_settings, key)
        let s:settings[key] = g:hfvim_settings[key]
        if s:settings.debug == 1
            echom '[debug] User Override -> ' key ' = ' g:hfvim_settings[key]
        endif
    endif
endfor

exec ':source ' . s:settings.dotvim_path . 'hfvim/utils.vim'
if has('vim_starting')
    exec 'set runtimepath+=' . MakePath('hfvim')
endif

call EnsureExists(MakePath('.cache'))

call Source('hfvim/bundle_groups.vim')
call Source('hfvim/bundles.vim')
call Source('hfvim/settings.vim')
call Source('hfvim/mappings.vim')
