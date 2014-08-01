" ==========================================================
" Define hfvim user settings before sourcing hfvimrc
" ==========================================================
let g:hfvim_settings = {}
let g:hfvim_settings.expected_major_version = 1
"let g:hfvim_settings.bundle_groups_excluded = []
let g:hfvim_settings.bundle_groups_included = ['cpp', 'actionscript', 'haxe', 'javascript', 'python']
let g:hfvim_settings.disabled_bundles = []

" ==========================================================
" Source hfvim to initialize the distribution
" ==========================================================
so ~/.vim/hfvim/hfvimrc.vim

set guifont=Inconsolata\ for\ Powerline:h14

nnoremap <leader>te :exec 'e ' . MakePath('configs/vimrc_work.vim')
