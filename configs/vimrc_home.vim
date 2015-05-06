" ==========================================================
" Define hfvim user settings before sourcing hfvimrc
" ==========================================================
let g:hfvim_settings = {}
let g:hfvim_settings.expected_major_version = 1
"let g:hfvim_settings.bundle_groups_excluded = []
let g:hfvim_settings.bundle_groups_included = ['cpp', 'actionscript', 'haxe', 'javascript', 'python']
let g:hfvim_settings.disabled_bundles = []

let g:hfvim_settings.dotvim_path = '~/.vim/'

let g:hfvim_settings.training_mode = 1
" ==========================================================
" Source hfvim to initialize the distribution
" ==========================================================
so ~/.vim.new/hfvim/hfvimrc.vim

set go-=T

let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
